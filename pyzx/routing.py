import copy
import math
from fractions import Fraction
from typing import Dict, List, Optional, Type, ClassVar, TypeVar, Generic, Set

from ..utils import EdgeType, VertexType, FractionLike
from ..graph.base import BaseGraph, VT, ET

# We need this type variable so that the subclasses of Gate return the correct type for functions like copy()
Tvar = TypeVar('Tvar', bound='Gate')

class TargetMapper(Generic[VT]):
    """
    This class is used to map the target parameters of a gate to rows, qubits, and vertices
    when converting them into a graph. Used by :func:`~pyzx.circuit.gates.Gate.to_graph`.
    """
    _qubits: Dict[int, int]
    _rows: Dict[int, int]
    _prev_vs: Dict[int, VT]
    _max_row: int

    def __init__(self):
        self._qubits = {}
        self._rows = {}
        self._prev_vs = {}
        self._max_row = 0

    def labels(self) -> Set[int]:
        """
        Returns the mapped labels.
        """
        return set(self._qubits.keys())

    def to_qubit(self, l: int) -> int:
        """
        Maps a label to the qubit id in the graph.
        """
        return self._qubits[l]

    def set_qubit(self, l: int, q: int) -> None:
        """
        Sets the qubit id for a label.
        """
        self._qubits[l] = q

    def next_row(self, l: int) -> int:
        """
        Returns the next free row in the label's qubit.
        """
        return self._rows[l]

    def set_next_row(self, l: int, row: int) -> None:
        """
        Sets the next free row in the label's qubit.
        """
        self._rows[l] = row
        self._max_row = max(self._max_row, row)

    def advance_next_row(self, l: int) -> None:
        """
        Advances the next free row in the label's qubit by one.
        """
        self.set_next_row(l, self.next_row(l)+1)

    def shift_all_rows(self, n: int) -> None:
        """
        Shifts all 'next rows' by n.
        """
        for l in self._rows.keys():
            self._rows[l] += n
        self._max_row += n

    # def set_all_rows(self, n: int) -> None:
    #     """
    #     Set the value of all 'next rows'.
    #     """
    #     for l in self._rows.keys():
    #         self._rows[l] = n
    #     self._max_row = max(self._max_row, n)

    def set_all_rows_to_max(self) -> None:
        for l in self._rows.keys():
            self._rows[l] = self._max_row

    def set_max_row(self, max_row: int) -> None:
        self._max_row = max_row

    def max_row(self) -> int:
        """
        Returns the highest 'next row' number.
        """
        return self._max_row

    def prev_vertex(self, l: int) -> VT:
        """
        Returns the previous vertex in the label's qubit.
        """
        return self._prev_vs[l]

    def set_prev_vertex(self, l: int, v: VT) -> None:
        """
        Sets the previous vertex in the label's qubit.
        """
        self._prev_vs[l] = v

    def add_label(self, l: int, row: int) -> None:
        """
        Adds a tracked label.

        :raises: ValueError if the label is already tracked.
        """
        if l in self._qubits:
            raise ValueError("Label {} already in use".format(str(l)))
        q = len(self._qubits)
        self.set_qubit(l, q)
        self.set_next_row(l, row)
        # r = self.max_row()
        # self.set_all_rows_to_max()

        # if compress_rows:
        #     self.set_next_row(l, r)
        # else:
        #     self.set_next_row(l, r+1)

    def remove_label(self, l: int) -> None:
        """
        Removes a tracked label.

        :raises: ValueError if the label is not tracked.
        """
        if l not in self._qubits:
            raise ValueError("Label {} not in use".format(str(l)))
        
        # self.set_all_rows_to_max()
        # if not compress_rows:
        #     self.shift_all_rows(1)

        del self._qubits[l]
        del self._rows[l]
        del self._prev_vs[l]
