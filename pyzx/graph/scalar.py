# PyZX - Python library for quantum circuit rewriting 
#        and optimization using the ZX-calculus
# Copyright (C) 2018 - Aleks Kissinger and John van de Wetering

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""This file contains the Scalar class used to represent a global scalar in a Graph."""

import math
import cmath
import copy
from fractions import Fraction
from typing import Dict, List, Any, Union
import json

from ..utils import FractionLike, phase_is_pauli, phase_is_clifford
from ..symbolic import Poly

__all__ = ['Scalar']

def cexp(val) -> complex:
    return cmath.exp(1j*math.pi*val)

unicode_superscript = {
    '0': '⁰',
    '1': '¹',
    '2': '²',
    '3': '³',
    '4': '⁴',
    '5': '⁵',
    '6': '⁶',
    '7': '⁷',
    '8': '⁸',
    '9': '⁹'
}

unicode_fractions = {
    Fraction(1,4): '¼',
    Fraction(1,2): '½',
    Fraction(3,4): '¾',
}

class Scalar(object):
    """Represents a global scalar for a Graph instance."""
    def __init__(self) -> None:
        self.power2: int = 0 # Stores power of square root of two
        self.phase: FractionLike = Fraction(0) # Stores complex phase of the number
        self.phasenodes: List[FractionLike] = [] # Stores list of legless spiders, by their phases.
        self.sum_of_phases: Dict[FractionLike, int] = {} # Represents the term (c1*exp(i*phase1) + ... + cn*exp(i*phaseN)). The dictionary maps phase -> coefficient.
        self.floatfactor: complex = 1.0
        self.is_unknown: bool = False # Whether this represents an unknown scalar value
        self.is_zero: bool = False

    def __repr__(self) -> str:
        return "Scalar({})".format(str(self))

    def __str__(self) -> str:
        s = ""
        try:
            s += "{0.real:.2f}{0.imag:+.2f}i = ".format(self.to_number())
        except:
            pass
        if self.floatfactor != 1.0:
            s += "{0.real:.2f}{0.imag:+.2f}i".format(self.floatfactor)
        s += "sqrt(2)^{:d}".format(self.power2)
        if self.phase:
            s += phase_to_str(self.phase)
        for node in self.phasenodes:
            s += "(1+exp(({})ipi))".format(str(node))
        if self.sum_of_phases:
            s += "(" + " + ".join([f"{coeff_to_str(coeff)}{phase_to_str(phase)}" for phase, coeff in self.sum_of_phases.items()]) + ")"
        return s

    def __complex__(self) -> complex:
        return self.to_number()

    def __eq__(self, other: object) -> bool:
        """Compares all fields for equality.

        Note that two Scalars can have the same output for to_number() even though not all their fields are equal."""
        if not isinstance(other, Scalar):
            return NotImplemented
        return (self.power2 == other.power2 and
                self.phase == other.phase and
                self.phasenodes == other.phasenodes and
                self.sum_of_phases == other.sum_of_phases and
                self.floatfactor == other.floatfactor and
                self.is_unknown == other.is_unknown and
                self.is_zero == other.is_zero)

    def polar_str(self) -> str:
        """Returns a human-readable string of the scalar in polar format"""
        r,th = cmath.polar(self.to_number())
        s = "{:.3}".format(r)
        if th != 0:
            s += " * exp(i pi * {:.3})".format(th/math.pi)
        return s

    def copy(self, conjugate: bool = False) -> 'Scalar':
        """Create a copy of the Scalar. If ``conjugate`` is set, the copy will be complex conjugated.

        Args:
            conjugate: set to True to return a complex-conjugated copy

        Returns:
            A copy of the Scalar
        """
        s = Scalar()
        s.power2 = self.power2
        s.phase = self.phase if not conjugate else -self.phase
        s.phasenodes = copy.copy(self.phasenodes) if not conjugate else [-p for p in self.phasenodes]
        s.floatfactor = self.floatfactor if not conjugate else self.floatfactor.conjugate()
        s.is_unknown = self.is_unknown
        s.is_zero = self.is_zero
        if not conjugate:
            s.sum_of_phases = copy.deepcopy(self.sum_of_phases)
        else:
            s.sum_of_phases = {-phase: coeff for phase, coeff in self.sum_of_phases.items()}
        return s

    def conjugate(self) -> 'Scalar':
        """Returns a new Scalar equal to the complex conjugate"""
        return self.copy(conjugate=True)

    def to_number(self) -> complex:
        if self.is_zero: return 0
        val = cexp(self.phase)
        for node in self.phasenodes: # Node should be a Fraction
            val *= 1+cexp(node)
        sum_of_phases_val = 0j
        for phase, coeff in self.sum_of_phases.items():
            sum_of_phases_val += coeff * cexp(phase)
        if sum_of_phases_val != 0:
            val *= sum_of_phases_val
        val *= math.sqrt(2)**self.power2
        return val*self.floatfactor

    def to_latex(self) -> str:
        """Converts the Scalar into a string that is compatible with LaTeX."""
        if self.is_zero: return "0"
        elif self.is_unknown: return "Unknown"
        f = self.floatfactor
        for node in self.phasenodes:
            f *= 1+cexp(node)
        if self.phase == 1:
            f *= -1

        s = "$"
        if abs(f+1) < 0.001: #f \approx -1
            s += "-"
        elif abs(f-1) > 0.0001: #f \neq 1
            s += str(self.floatfactor)
        if self.power2 != 0:
            s += r"\sqrt{{2}}^{{{:d}}}".format(self.power2)
        if self.phase not in (0,1):
            if isinstance(self.phase, Poly):
                s += fr"\exp(i\pi ~({str(self.phase)}))"
            else:
                s += r"\exp(i~\frac{{{:d}\pi}}{{{:d}}})".format(self.phase.numerator,self.phase.denominator)

        if self.sum_of_phases:
            terms = []
            for phase, coeff in self.sum_of_phases.items():
                coeff_str = coeff_to_str(coeff)
                if isinstance(phase, Poly):
                    phase_str = fr"\exp(i\pi ~({str(phase)}))"
                else:
                    phase_str = r"\exp(i~\frac{{{:d}\pi}}{{{:d}}})".format(
                        phase.numerator, phase.denominator)
                terms.append(f"{coeff_str}{phase_str}")
            if terms:
                s += "(" + " + ".join(terms) + ")"

        s += "$"
        if s == "$$": return ""
        return s

    def to_unicode(self) -> str:
        """Returns a representation of the scalar that uses unicode
        to represent pi's and sqrt's."""
        if self.is_zero: return "0"
        elif self.is_unknown: return "Unknown"
        f = self.floatfactor
        for node in self.phasenodes:
            f *= 1+cexp(node)
        s = ""
        phase = self.phase
        if not isinstance(phase, Poly):
            phase = Fraction(phase)
        if phase >= 1:
            f *= -1
            phase -= 1

        if abs(f+1) > 0.001 and abs(f-1) > 0.001:
            return str(f)

        if abs(f+1) < 0.001: #f \approx -1
            s += "-"
        if self.power2 != 0:
            s += r"√2"
            if self.power2 < 0:
                s += "⁻"
            val = str(abs(self.power2))
            s += "".join([unicode_superscript[i] for i in val])
        if phase != 0:
            if isinstance(phase, Fraction) and phase in unicode_fractions:
                s += "exp(i" + unicode_fractions[phase] + "π)"
            else:
                s += phase_to_str(phase, unicode=True)
        if self.sum_of_phases:
            terms = []
            for ph, coeff in self.sum_of_phases.items():
                term = coeff_to_str(coeff)
                if isinstance(ph, Fraction) and ph in unicode_fractions:
                    term += "exp(i" + unicode_fractions[ph] + "π)"
                else:
                    term += phase_to_str(phase, unicode=True)
                terms.append(term)
            if len(terms) == 1:
                s += terms[0]
            elif len(terms) > 1:
                s += "(" + " + ".join(terms) + ")"
        if s == "":
            s = "1"
        return s

    def to_dict(self) -> Dict[str, Any]:
        d = {"power2": self.power2, "phase": str(self.phase)}
        if abs(self.floatfactor - 1) > 0.00001:
            d["floatfactor"] =  str(self.floatfactor)
        if self.phasenodes:
            d["phasenodes"] = [str(p) for p in self.phasenodes]
        if self.sum_of_phases:
            d["sum_of_phases"] = {str(phase): coeff for phase, coeff in self.sum_of_phases.items()}
        if self.is_zero:
            d["is_zero"] = self.is_zero
        if self.is_unknown:
            d["is_unknown"] = self.is_unknown,
        return d

    def to_json(self) -> str:
        return json.dumps(self.to_dict())

    @classmethod
    def from_json(cls, s: Union[str,Dict[str,Any]]) -> 'Scalar':
        from .jsonparser import string_to_phase

        if isinstance(s, str):
            d = json.loads(s)
        else:
            d = s
        scalar = Scalar()
        scalar.phase = string_to_phase(d["phase"])
        scalar.power2 = int(d["power2"])
        if "floatfactor" in d:
            scalar.floatfactor = complex(d["floatfactor"])
        if "phasenodes" in d:
            scalar.phasenodes = [string_to_phase(p) for p in d["phasenodes"]]
        if "sum_of_phases" in d:
            scalar.sum_of_phases = {string_to_phase(phase): coeff for phase, coeff in d["sum_of_phases"].items()}
        if "is_zero" in d:
            scalar.is_zero = bool(d["is_zero"])
        if "is_unknown" in d:
            scalar.is_unknown = bool(d["is_unknown"])
        return scalar

    def set_unknown(self) -> None:
        self.is_unknown = True

    def add_power(self, n) -> None:
        """Adds a factor of sqrt(2)^n to the scalar."""
        self.power2 += n

    def add_phase(self, phase: FractionLike) -> None:
        """Multiplies the scalar by a complex phase."""
        self.phase = (self.phase + phase) % 2

    def add_node(self, node: FractionLike) -> None:
        """A solitary spider with a phase ``node`` is converted into the
        scalar 1+e^(i*pi*node)."""
        if node == 0:
            self.power2 += 2
        else:
            self.phasenodes.append(node)
        if node == 1: self.is_zero = True

    def add_float(self,f: complex) -> None:
        if f == 0.0:
            self.is_zero = True
        self.floatfactor *= f

    def multiply_sum_of_phases(self, phases: Dict[FractionLike,int]) -> None:
        """Adds a sum of phases to the scalar. The input is a dictionary mapping
        phase -> coefficient in the sum."""
        new_sum_of_phases: Dict[FractionLike, int] = {}
        # Use the distributive law: (a*e^ip1)(b*e^ip2) = (a*b)*e^i(p1+p2)
        if not self.sum_of_phases:
            self.sum_of_phases = {0:1}
        for phase1, coeff1 in phases.items():
            for phase2, coeff2 in self.sum_of_phases.items():
                new_phase = (phase1 + phase2) % 2
                new_coeff = coeff1 * coeff2
                # Add the resulting term, combining with any existing term that has the same new polynomial
                new_sum_of_phases[new_phase] = new_sum_of_phases.get(new_phase, 0) + new_coeff
                if new_sum_of_phases[new_phase] == 0:
                    del new_sum_of_phases[new_phase]
        self.sum_of_phases = new_sum_of_phases

    def mult_with_scalar(self, other: 'Scalar') -> None:
        """Multiplies two instances of Scalar together."""
        self.power2 += other.power2
        self.phase = (self.phase +other.phase)%2
        self.phasenodes.extend(other.phasenodes)
        self.multiply_sum_of_phases(other.sum_of_phases)
        self.floatfactor *= other.floatfactor
        if other.is_zero: self.is_zero = True
        if other.is_unknown: self.is_unknown = True

    def add_spider_pair(self, p1: FractionLike,p2: FractionLike) -> None:
        """Add the scalar corresponding to a connected pair of spiders (p1)-H-(p2)."""
        # These if statements look quite arbitrary, but they are just calculations of the scalar
        # of a pair of connected single wire spiders of opposite colors.
        # We make special cases for Clifford phases and pi/4 phases.
        if phase_is_pauli(p2):
            p1,p2 = p2, p1
        if phase_is_pauli(p1):
            self.add_power(1)
            self.add_phase(p1 * p2)
            return

        if phase_is_clifford(p2):
            p1, p2 = p2, p1
        if phase_is_clifford(p1) and not phase_is_pauli(p1):
            self.add_phase(Fraction(3,2) * p1 - Fraction(1,2))
            self.add_node((p2-p1)%2)
            return

        if (p1 + p2) % 2 == 0 and not isinstance(p1, Poly) and not isinstance(p2, Poly):
            if p1.denominator == 4:
                if p1.numerator in (3,5):
                    self.add_phase(Fraction(1))
                return
            self.add_power(1)
            self.add_float(math.cos(p1))
            return

        # Generic case
        self.add_power(-1)
        # add the sum of phases 1 + e^(i pi p1) + e^(i pi p2) - e^(i pi (p1+p2))
        self.multiply_sum_of_phases({0:1, p1:1, p2:1, (p1+p2)%2:-1})
        return


def coeff_to_str(coeff: int) -> str:
    if coeff == 1:
        return ""
    if coeff == -1:
        return "-"
    return str(coeff) + "*"

def phase_to_str(phase: FractionLike, unicode: bool = False) -> str:
    pi = "π" if unicode else "pi"
    if phase == 0:
        return "1"
    if phase == 1:
        return f"exp(i{pi})"
    if isinstance(phase, Poly):
        if len(phase.terms) == 1:
            return f"exp({str(phase)}i{pi})"
        return f"exp(({str(phase)})i{pi})"
    if isinstance(phase, Fraction):
        return f"exp({phase.numerator}/{phase.denominator}i{pi})"
    return f"exp({str(phase)}i{pi})"
