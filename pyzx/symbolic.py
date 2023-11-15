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

"""This file contains the definition of the symbolic representation of 
parameters that can be used in Graphs. Var defines a variable, which can
either be a Boolean or continuous variable. Term is a product of variables,
and Poly is a sum of terms. 
Lark is used to define a parser that can translate a string into a Poly.
"""

from typing import Any, Callable, Union, Optional
from lark import Lark, Transformer
from functools import reduce
from operator import add, mul
from fractions import Fraction


class Var:
    name: str
    _is_bool: bool
    _types_dict: Optional[Union[bool, dict[str, bool]]]

    def __init__(self, name: str, data: Union[bool, dict[str, bool]]):
        self.name = name
        if isinstance(data, dict):
            self._types_dict = data
            self._frozen = False
            self._is_bool = False
        else:
            self._types_dict = None
            self._frozen = True
            self._is_bool = data

    @property
    def is_bool(self) -> bool:
        if self._frozen:
            return self._is_bool
        else:
            assert isinstance(self._types_dict, dict)
            return self._types_dict[self.name]

    def __repr__(self) -> str:
        return self.name

    def __lt__(self, other: 'Var') -> bool:
        if int(self.is_bool) == int(other.is_bool):
            return self.name < other.name
        return int(self.is_bool) < int(other.is_bool)

    def __hash__(self) -> int:
        # Variables with the same name map to the same type
        # within the same graph, so no need to include is_bool
        # in the hash.
        return int(hash(self.name))

    def __eq__(self, other: object) -> bool:
        return self.__hash__() == other.__hash__()

    def freeze(self) -> None:
        if not self._frozen:
            assert isinstance(self._types_dict, dict)
            self._is_bool = self._types_dict[self.name]
            self._frozen = True
            self._types_dict = None

    def __copy__(self) -> 'Var':
        if self._frozen:
            return Var(self.name, self.is_bool)
        else:
            assert isinstance(self._types_dict, dict)
            return Var(self.name, self._types_dict)

    def __deepcopy__(self, _memo: object) -> 'Var':
        return self.__copy__()

class Term:
    vars: list[tuple[Var, int]]

    def __init__(self, vars: list[tuple[Var,int]]) -> None:
        self.vars = vars

    def freeze(self) -> None:
        for var, _ in self.vars:
            var.freeze()

    def free_vars(self) -> set[Var]:
        return set(var for var, _ in self.vars)

    def __repr__(self) -> str:
        vs = []
        for v, c in self.vars:
            if c == 1:
                vs.append(f'{v}')
            else:
                vs.append(f'{v}^{c}')
        return '*'.join(vs)

    def __mul__(self, other: 'Term') -> 'Term':
        vs = dict()
        for v, c in self.vars + other.vars:
            if v not in vs: vs[v] = c
            else: vs[v] += c
            # TODO deal with fractional / symbolic powers
            if v.is_bool and c > 1:
                vs[v] = 1
        return Term([(v, c) for v, c in vs.items()])

    def __hash__(self) -> int:
        return hash(tuple(sorted(self.vars)))

    def __eq__(self, other: object) -> bool:
        return self.__hash__() == other.__hash__()

    def substitute(self, var_map: dict[Var, Union[float, complex, 'Fraction']]) -> tuple[Union[float, complex, 'Fraction'], 'Term']:
        """Substitute variables in the term with the given values. Returns a tuple
        of the coefficient and the new term.
        """
        coeff: Union[float, complex, 'Fraction'] = 1.
        new_vars = []
        for v, c in self.vars:
            if v in var_map:
                coeff *= var_map[v] ** c
            else:
                new_vars.append((v, c))
        return (coeff, Term(new_vars))


class Poly:
    terms: list[tuple[Union[int, float, complex, Fraction], Term]]

    def __init__(self, terms: list[tuple[Union[int, float, complex, Fraction], Term]]) -> None:
        self.terms = terms

    def freeze(self) -> None:
        for _, term in self.terms:
            term.freeze()

    def free_vars(self) -> set[Var]:
        output = set()
        for _, term in self.terms:
            output.update(term.free_vars())
        return output

    def __add__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        if isinstance(other, (int, float, complex, Fraction)):
            other = Poly([(other, Term([]))])
        counter = dict()
        for c, t in self.terms + other.terms:
            if t not in counter: counter[t] = c
            else: counter[t] += c
            counter_t = counter[t] # need to assign to variable to avoid type errors
            if not isinstance(counter_t, complex) and len(t.vars) > 0 and all(tt[0].is_bool for tt in t.vars):
                counter[t] = counter_t % 2

        # remove terms with coefficient 0
        for t in list(counter.keys()):
            if counter[t] == 0:
                del counter[t]
        return Poly([(c, t) for t, c in counter.items()])

    __radd__ = __add__

    def __neg__(self) -> 'Poly':
        return Poly([(-c, t) for c, t in self.terms])

    def __sub__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        return self + (-other)

    def __rsub__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        return other + (-self)

    def __mul__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        if isinstance(other, (int, float, complex, Fraction)):
            other = Poly([(other, Term([]))])
        p = Poly([])
        for c1, t1 in self.terms:
            for c2, t2 in other.terms:
                p += Poly([(c1 * c2, t1 * t2)])
        return p

    __rmul__ = __mul__

    # this long division algorithm is written by copilot; I am not sure if it is correct
    def __truediv__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        if isinstance(other, (int, float, complex, Fraction)):
            other = Poly([(other, Term([]))])
        result = Poly([])
        while len(self.terms) != 0 and self.degree >= other.degree:
            leading_term_ratio = self.terms[0][0] / other.terms[0][0]
            self -= other * leading_term_ratio
            result += Poly([(leading_term_ratio, Term([]))])
        return result

    def __pow__(self, other: int) -> 'Poly':
        if other < 0:
            return Poly([(1, Term([]))]) / (self ** (-other))
        if other == 0:
            return Poly([(1, Term([]))])
        if other == 1:
            return self
        return self * (self ** (other - 1))

    def __mod__(self, other: int) -> 'Poly':
        return Poly([(c % other, t) for c, t in self.terms if not isinstance(c, complex)])

    def __repr__(self) -> str:
        return f'Poly({str(self)})'

    def __str__(self) -> str:
        ts = []
        for c, t in self.terms:
            if t == Term([]):
                ts.append(f'{c}')
            elif c == 1:
                ts.append(f'{t}')
            else:
                ts.append(f'{c}{t}')
        return ' + '.join(ts)

    def __eq__(self, other: object) -> bool:
        if isinstance(other, (int, float, Fraction)):
            if other == 0:
                other = Poly([])
            else:
                other = Poly([(other, Term([]))])
        if not isinstance(other, Poly): return False
        return set(self.terms) == set(other.terms)

    def __hash__(self) -> int:
        return hash(tuple(sorted(self.terms)))

    @property
    def degree(self) -> int:
        powers = [sum(c for _, c in t.vars) for coeff, t in self.terms if coeff != 0]
        if powers:
            return max(powers)
        return 0

    @property
    def is_pauli(self) -> bool:
        for c, t in self.terms:
            if isinstance(c, complex):
                return False
            if not all(v.is_bool for v, _ in t.vars):
                return False
            if c % 1 != 0:
                return False
        return True

    @property
    def is_clifford(self) -> bool:
        for c, t in self.terms:
            if isinstance(c, complex):
                return False
            if not all(v.is_bool for v, _ in t.vars):
                return False
            if t.vars: # Contains a Boolean variable
               if c % 1 != 0: # With weight not equal to 1
                return False
            else:
                if c*2 % 1 != 0: # Variable-free term with weight not equal to 1/2
                    return False
        return True

    def substitute(self, var_map: dict[Var, Union[float, complex, 'Fraction']]) -> 'Poly':
        """Substitute variables in the polynomial with the given values."""
        p = Poly([])
        for c, t in self.terms:
            coeff, term = t.substitute(var_map)
            p += Poly([(c * coeff, term)])
        return p

def new_var(name: str, types_dict: Union[bool, dict[str, bool]]) -> Poly:
    return Poly([(1, Term([(Var(name, types_dict), 1)]))])

def new_const(coeff: Union[int, Fraction]) -> Poly:
    return Poly([(coeff, Term([]))])


poly_grammar = Lark("""
    start      : "(" start ")" | term ("+" term)*
    term       : (intf | frac)? factor ("*" factor)*
    ?factor    : intf | frac | pi | pifrac | var
    var        : CNAME
    intf       : INT
    pi         : "\\pi" | "pi"
    frac       : INT "/" INT
    pifrac     : [INT] pi "/" INT

    %import common.INT
    %import common.CNAME
    %import common.WS
    %ignore WS
    """,
    parser='lalr',
    maybe_placeholders=True)

class PolyTransformer(Transformer):
    def __init__(self, new_var: Callable[[str], Poly]):
        super().__init__()

        self._new_var = new_var

    def start(self, items: list[Poly]) -> Poly:
        return reduce(add, items)

    def term(self, items: list[Poly]) -> Poly:
        return reduce(mul, items)

    def var(self, items: list[Any]) -> Poly:
        v = str(items[0])
        return self._new_var(v)

    def pi(self, _: list[Any]) -> Poly:
        return new_const(1)

    def intf(self, items: list[Any]) -> Poly:
        return new_const(int(items[0]))

    def frac(self, items: list[Any]) -> Poly:
        return new_const(Fraction(int(items[0]), int(items[1])))

    def pifrac(self, items: list[Any]) -> Poly:
        numerator = int(items[0]) if items[0] else 1
        return new_const(Fraction(numerator, int(items[2])))

def parse(expr: str, new_var: Callable[[str], Poly]) -> Poly:
    tree = poly_grammar.parse(expr)
    return PolyTransformer(new_var).transform(tree)
