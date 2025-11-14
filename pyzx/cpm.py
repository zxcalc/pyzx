

"""
Double-wire (CPM) lift for ZX calculus.

This module implements a completely positive map (CPM) semantics on top of the
standard ZX calculus by "doubling wires". For a ZX diagram D with linear map
A = [[D]], the double-wire lift represents the superoperator:
    ρ ↦ A ρ A†
"""

from __future__ import annotations
from typing import List, Tuple, Callable, Optional, Any, Dict, Union
import numpy as np
from numpy.typing import NDArray

from .graph.base import BaseGraph, VT, ET
from .tensor import tensorfy, tensor_to_matrix


__all__ = ['DoubleWireDiagram', 'lift', 'DensityMatrix']

DensityMatrix = NDArray[np.complex128]


class DoubleWireDiagram:
    """
    Represents a double-wire (CPM) diagram as a linear combination of base ZX diagrams.

    Each term (q_i, D_i) represents the superoperator ρ ↦ q_i * A_i ρ A_i†
    where A_i = [[D_i]] is the linear map implemented by diagram D_i.

    The full diagram implements: ρ ↦ Σ_i q_i * A_i ρ A_i†

    Attributes:
        terms: List of (coefficient, base_diagram) tuples
        num_inputs: Number of input wires (qubits)
        num_outputs: Number of output wires (qubits)
    """

    def __init__(self,
                 terms: List[Tuple[complex, BaseGraph[VT, ET]]],
                 num_inputs: Optional[int] = None,
                 num_outputs: Optional[int] = None):
        """
        Initialize a double-wire diagram from a list of weighted base diagrams.

        Args:
            terms: List of (coefficient, diagram) tuples
            num_inputs: Number of input wires (auto-detected if None)
            num_outputs: Number of output wires (auto-detected if None)

        Raises:
            ValueError: If terms is empty or diagrams have inconsistent arities
        """
        if not terms:
            raise ValueError("DoubleWireDiagram requires at least one term")

        self.terms = terms

        # Validate and determine arity
        first_diagram = terms[0][1]
        self.num_inputs = num_inputs if num_inputs is not None else len(first_diagram.inputs())
        self.num_outputs = num_outputs if num_outputs is not None else len(first_diagram.outputs())

        for coeff, diagram in terms:
            n_in = len(diagram.inputs())
            n_out = len(diagram.outputs())
            if n_in != self.num_inputs:
                raise ValueError(f"Inconsistent input arity: expected {self.num_inputs}, got {n_in}")
            if n_out != self.num_outputs:
                raise ValueError(f"Inconsistent output arity: expected {self.num_outputs}, got {n_out}")

    @classmethod
    def from_diagram(cls, diagram: BaseGraph[VT, ET], coefficient: complex = 1.0) -> DoubleWireDiagram:
        """
        Create a double-wire diagram from a single base diagram.

        Args:
            diagram: Base ZX diagram to lift
            coefficient: Scalar coefficient (default 1.0)

        Returns:
            DoubleWireDiagram wrapping the base diagram
        """
        return cls([(coefficient, diagram.copy())])

    def compose(self, other: DoubleWireDiagram) -> DoubleWireDiagram:
        """
        Sequential composition: self ; other.

        Implements: (Σ_i q_i D_i) ; (Σ_j r_j E_j) = Σ_{i,j} (q_i r_j) (D_i ; E_j)

        Args:
            other: Double-wire diagram to compose with

        Returns:
            Composed double-wire diagram

        Raises:
            ValueError: If output arity of self doesn't match input arity of other
        """
        if self.num_outputs != other.num_inputs:
            raise ValueError(
                f"Cannot compose: output arity {self.num_outputs} "
                f"doesn't match input arity {other.num_inputs}"
            )

        result_terms = []
        for coeff1, diagram1 in self.terms:
            for coeff2, diagram2 in other.terms:
                # Copy diagrams to avoid mutation
                d1 = diagram1.copy()
                d2 = diagram2.copy()
                # Compose the base diagrams
                d1.compose(d2)
                # Multiply coefficients
                result_terms.append((coeff1 * coeff2, d1))

        return DoubleWireDiagram(result_terms, self.num_inputs, other.num_outputs)

    def tensor(self, other: DoubleWireDiagram) -> DoubleWireDiagram:
        """
        Tensor product: self ⊗ other.

        Implements: (Σ_i q_i D_i) ⊗ (Σ_j r_j E_j) = Σ_{i,j} (q_i r_j) (D_i ⊗ E_j)

        Args:
            other: Double-wire diagram to tensor with

        Returns:
            Tensored double-wire diagram
        """
        result_terms = []
        for coeff1, diagram1 in self.terms:
            for coeff2, diagram2 in other.terms:
                # Copy first diagram and tensor with second
                d1 = diagram1.copy()
                d_result = d1.tensor(diagram2)
                # Multiply coefficients
                result_terms.append((coeff1 * coeff2, d_result))

        return DoubleWireDiagram(
            result_terms,
            self.num_inputs + other.num_inputs,
            self.num_outputs + other.num_outputs
        )

    def scale(self, scalar: complex) -> DoubleWireDiagram:
        """
        Scalar multiplication.

        Args:
            scalar: Complex scalar to multiply

        Returns:
            Scaled double-wire diagram
        """
        result_terms = [(scalar * coeff, diagram.copy()) for coeff, diagram in self.terms]
        return DoubleWireDiagram(result_terms, self.num_inputs, self.num_outputs)

    def add(self, other: DoubleWireDiagram) -> DoubleWireDiagram:
        """
        Linear combination: self + other.

        Args:
            other: Double-wire diagram to add

        Returns:
            Sum as a double-wire diagram

        Raises:
            ValueError: If arities don't match
        """
        if self.num_inputs != other.num_inputs or self.num_outputs != other.num_outputs:
            raise ValueError(
                f"Cannot add diagrams with different arities: "
                f"({self.num_inputs}, {self.num_outputs}) vs "
                f"({other.num_inputs}, {other.num_outputs})"
            )

        # Combine terms from both diagrams
        result_terms = [(coeff, diagram.copy()) for coeff, diagram in self.terms]
        result_terms.extend([(coeff, diagram.copy()) for coeff, diagram in other.terms])

        return DoubleWireDiagram(result_terms, self.num_inputs, self.num_outputs)

    def dagger(self) -> DoubleWireDiagram:
        """
        Dagger operation: conjugate coefficients and adjoint diagrams.

        For density operator actions, this should leave the map invariant
        (since we're representing A ρ A†, taking † gives A* ρ† A† = A ρ A†).

        Returns:
            Dagger of this double-wire diagram
        """
        result_terms = []
        for coeff, diagram in self.terms:
            # Conjugate coefficient and adjoint the diagram
            # adjoint() returns a new graph with inputs/outputs swapped
            d_adj = diagram.adjoint()
            result_terms.append((np.conj(coeff), d_adj))

        # Note: inputs and outputs swap under adjoint
        return DoubleWireDiagram(result_terms, self.num_outputs, self.num_inputs)

    def to_action(self) -> Callable[[DensityMatrix], DensityMatrix]:
        """
        Evaluate to action form: a callable that acts on density matrices.

        Returns a function ρ ↦ Σ_i q_i * A_i ρ A_i†

        Returns:
            Callable that takes a density matrix and returns the transformed density matrix

        Raises:
            ValueError: If input/output arities differ (non-square map)
        """
        if self.num_inputs != self.num_outputs:
            raise ValueError(
                f"Cannot create action for non-square map: "
                f"{self.num_inputs} inputs, {self.num_outputs} outputs"
            )

        # Pre-compute all the A matrices
        matrices: List[Tuple[complex, NDArray[np.complex128]]] = []
        for coeff, diagram in self.terms:
            # Get tensor and convert to matrix
            tensor = tensorfy(diagram, preserve_scalar=True)
            matrix = tensor_to_matrix(tensor, self.num_inputs, self.num_outputs)
            matrices.append((coeff, matrix))

        def action(rho: DensityMatrix) -> DensityMatrix:
            """Apply the CPM to a density matrix."""
            if rho.shape != (2**self.num_inputs, 2**self.num_inputs):
                raise ValueError(
                    f"Density matrix has wrong shape: expected "
                    f"{(2**self.num_inputs, 2**self.num_inputs)}, got {rho.shape}"
                )

            result = np.zeros_like(rho, dtype=np.complex128)
            for coeff, A in matrices:
                # Compute A ρ A†
                result += coeff * (A @ rho @ A.conj().T)

            return result

        return action

    def to_superoperator(self) -> NDArray[np.complex128]:
        """
        Evaluate to superoperator form: explicit matrix representation.

        Returns the matrix representation using the column-stacking convention:
        vec(A ρ A†) = (A ⊗ A*) vec(ρ)

        The full superoperator is: Σ_i q_i (A_i ⊗ A_i*)

        Returns:
            Superoperator matrix of shape (2^(2*n_out), 2^(2*n_in))
            where n_in = num_inputs, n_out = num_outputs
        """
        dim_in = 2**self.num_inputs
        dim_out = 2**self.num_outputs
        superop = np.zeros((dim_out**2, dim_in**2), dtype=np.complex128)

        for coeff, diagram in self.terms:
            # Get tensor and convert to matrix
            tensor = tensorfy(diagram, preserve_scalar=True)
            A = tensor_to_matrix(tensor, self.num_inputs, self.num_outputs)

            # Compute A ⊗ A* (Kronecker product)
            kraus_superop = np.kron(A, np.conj(A))
            superop += coeff * kraus_superop

        return superop

    def __str__(self) -> str:
        """String representation."""
        if len(self.terms) == 1:
            coeff, _ = self.terms[0]
            if np.isclose(coeff, 1.0):
                return f"DW[{self.num_inputs}→{self.num_outputs}]"
            else:
                return f"DW[({coeff:.3f})⟪·⟫: {self.num_inputs}→{self.num_outputs}]"
        else:
            return f"DW[Σ({len(self.terms)} terms): {self.num_inputs}→{self.num_outputs}]"

    def __repr__(self) -> str:
        """Detailed representation."""
        terms_str = ", ".join([f"({coeff:.3f}, <diagram>)" for coeff, _ in self.terms])
        return f"DoubleWireDiagram([{terms_str}], {self.num_inputs}→{self.num_outputs})"

    def to_dict(self) -> Dict[str, Any]:
        """
        Serialize to dictionary format for round-trip testing.

        Returns:
            Dictionary representation of the diagram
        """
        import json
        from .graph.jsonparser import graph_to_json

        serialized_terms = []
        for coeff, diagram in self.terms:
            # Convert coefficient to real/imag parts for JSON compatibility
            coeff_dict = {
                "real": float(np.real(coeff)),
                "imag": float(np.imag(coeff))
            }
            # Serialize the base diagram (graph_to_json returns a JSON string)
            diagram_json_str = graph_to_json(diagram)
            serialized_terms.append({"coeff": coeff_dict, "diagram": diagram_json_str})

        return {
            "type": "DoubleWireDiagram",
            "num_inputs": self.num_inputs,
            "num_outputs": self.num_outputs,
            "terms": serialized_terms
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> DoubleWireDiagram:
        """
        Deserialize from dictionary format.

        Args:
            data: Dictionary representation

        Returns:
            Reconstructed DoubleWireDiagram
        """
        import json as json_module
        from .graph.jsonparser import json_to_graph

        terms = []
        for term_data in data["terms"]:
            coeff_dict = term_data["coeff"]
            coeff = complex(coeff_dict["real"], coeff_dict["imag"])
            # json_to_graph expects a JSON string
            diagram = json_to_graph(term_data["diagram"])

            # Workaround: PyZX's json_to_graph doesn't restore inputs/outputs,
            # so we need to extract and restore them manually
            diagram_dict = json_module.loads(term_data["diagram"])
            if 'inputs' in diagram_dict and 'outputs' in diagram_dict:
                diagram.set_inputs(tuple(diagram_dict['inputs']))
                diagram.set_outputs(tuple(diagram_dict['outputs']))

            terms.append((coeff, diagram))

        return cls(terms, data["num_inputs"], data["num_outputs"])

    # Operator overloads for convenience
    def __add__(self, other: DoubleWireDiagram) -> DoubleWireDiagram:
        """Addition via + operator."""
        return self.add(other)

    def __mul__(self, scalar: complex) -> DoubleWireDiagram:
        """Scalar multiplication via * operator."""
        return self.scale(scalar)

    def __rmul__(self, scalar: complex) -> DoubleWireDiagram:
        """Right scalar multiplication."""
        return self.scale(scalar)

    def __matmul__(self, other: DoubleWireDiagram) -> DoubleWireDiagram:
        """Tensor product via @ operator."""
        return self.tensor(other)


def lift(diagram: BaseGraph[VT, ET], coefficient: complex = 1.0) -> DoubleWireDiagram:
    """
    Lift a base ZX diagram to a double-wire diagram.

    This is a convenience function equivalent to DoubleWireDiagram.from_diagram().

    Args:
        diagram: Base ZX diagram to lift
        coefficient: Scalar coefficient (default 1.0)

    Returns:
        DoubleWireDiagram representing the lifted map
    """
    return DoubleWireDiagram.from_diagram(diagram, coefficient)
