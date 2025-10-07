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

from ..utils import FloatInt, FractionLike, phase_is_pauli, phase_is_clifford
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
        self.floatfactor: complex = 1.0
        self.is_unknown: bool = False # Whether this represents an unknown scalar value
        self.is_zero: bool = False

    def __repr__(self) -> str:
        return "Scalar({})".format(str(self))

    def __str__(self) -> str:
        if self.is_unknown:
            return "UNKNOWN"
        s = "{0.real:.2f}{0.imag:+.2f}i = ".format(self.to_number())
        if self.floatfactor != 1.0:
            s += "{0.real:.2f}{0.imag:+.2f}i".format(self.floatfactor)
        if self.phase:
            s += "exp({}ipi)".format(str(self.phase))
        s += "sqrt(2)^{:d}".format(self.power2)
        for node in self.phasenodes:
            s += "(1+exp({}ipi))".format(str(node))
        return s

    def __complex__(self) -> complex:
        return self.to_number()

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
        return s
    
    def conjugate(self) -> 'Scalar':
        """Returns a new Scalar equal to the complex conjugate"""
        return self.copy(conjugate=True)

    def to_number(self) -> complex:
        if self.is_zero: return 0
        val = cexp(self.phase)
        for node in self.phasenodes: # Node should be a Fraction
            val *= 1+cexp(node)
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
                s += fr"\exp(i~{str(self.phase)})".format(str(self.phase))
            else:
                s += r"\exp(i~\frac{{{:d}\pi}}{{{:d}}})".format(self.phase.numerator,self.phase.denominator)
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
        if isinstance(self.phase, Poly):
            raise NotImplementedError("Unicode representation of Poly not implemented")
        phase = Fraction(self.phase)
        if self.phase >= 1:
            f *= -1
            phase -= 1

        if abs(f+1) > 0.001 and abs(f-1) > 0.001:
            return str(f)

        s = ""
        if abs(f+1) < 0.001: #f \approx -1
            s += "-"
        if self.power2 != 0:
            s += r"√2"
            if self.power2 < 0:
                s += "⁻"
            val = str(abs(self.power2))
            s += "".join([unicode_superscript[i] for i in val])
        if phase != 0:
            s += "exp(i"
            if phase in unicode_fractions:
                s += unicode_fractions[phase] + "π)"
            else:
                s += "{:d}/{:d}π)".format(phase.numerator,phase.denominator)
        return s

    def to_dict(self) -> Dict[str, Any]:
        d = {"power2": self.power2, "phase": str(self.phase)}
        if abs(self.floatfactor - 1) > 0.00001:
            d["floatfactor"] =  str(self.floatfactor)
        if self.phasenodes:
            d["phasenodes"] = [str(p) for p in self.phasenodes]
        if self.is_zero:
            d["is_zero"] = self.is_zero
        if self.is_unknown:
            d["is_unknown"] = self.is_unknown,
        return d

    def to_json(self) -> str:
        return json.dumps(self.to_dict())

    @classmethod
    def from_json(cls, s: Union[str,Dict[str,Any]]) -> 'Scalar':
        if isinstance(s, str):
            d = json.loads(s)
        else:
            d = s
        # print('scalar from json', repr(d))
        scalar = Scalar()
        scalar.phase = Fraction(d["phase"]) # TODO support parameters
        scalar.power2 = int(d["power2"])
        if "floatfactor" in d:
            scalar.floatfactor = complex(d["floatfactor"])
        if "phasenodes" in d:
            scalar.phasenodes = [Fraction(p) for p in d["phasenodes"]]
        if "is_zero" in d:
            scalar.is_zero = bool(d["is_zero"])
        if "is_unknown" in d:
            scalar.is_unknown = bool(d["is_unknown"])
        return scalar

    def set_unknown(self) -> None:
        self.is_unknown = True
        self.phasenodes = []

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

    def mult_with_scalar(self, other: 'Scalar') -> None:
        """Multiplies two instances of Scalar together."""
        self.power2 += other.power2
        self.phase = (self.phase +other.phase)%2
        self.phasenodes.extend(other.phasenodes)
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
        self.add_float(1+cexp(p1)+cexp(p2) - cexp(p1+p2))
        return
