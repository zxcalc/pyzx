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

from typing import Any, Callable, Union, Optional, Dict, List, Tuple, Set
from lark import Lark, Transformer
from functools import reduce
from operator import add, mul
from fractions import Fraction


class VarRegistry:
    """Registry to track variable types (Boolean/continuous) for a specific graph"""

    types: Dict[str, bool]  # name -> is_bool

    def __init__(self, types: Optional[Dict[str, bool]] = None):
        self.types = types if types is not None else {}

    def get_type(self, name: str, default: bool = False) -> bool:
        """Get the type of a variable, using default if not found"""
        return self.types.get(name, default)

    def set_type(self, name: str, is_bool: bool) -> None:
        """Set the type of a variable"""
        self.types[name] = is_bool

    def vars(self) -> Set[str]:
        """Get the set of variable names in the registry"""
        return set(self.types.keys())


class Var:
    """Symbolic variable that keeps track of its Boolean/continuous type.

    Variables are always associated with a :class:`VarRegistry`, which records
    whether the variable should be treated as Boolean or a general real-valued parameter.
    Unless an explicit registry is provided, a fresh registry is created so the
    variable can stand on its own.
    """
    name: str
    _registry: VarRegistry

    def __init__(self, name: str, is_bool: bool = False, registry: Optional[VarRegistry] = None):
        self.name = name
        if registry is None:
            self._registry = VarRegistry()
        else:
            self._registry = registry
        self._registry.set_type(name, is_bool)

    @property
    def is_bool(self) -> bool:
        return self._registry.get_type(self.name)

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
        if not isinstance(other, Var):
            return False
        return self.name == other.name

    def __copy__(self) -> 'Var':
        return Var(self.name, self.is_bool, self._registry)

    def __deepcopy__(self, _memo: object) -> 'Var':
        return self.__copy__()

    def rebind_to_registry(self, new_registry: VarRegistry) -> None:
        """Rebind this variable to a new registry"""
        self._registry = new_registry
        new_registry.set_type(self.name, self.is_bool)

class Term:
    """Product of symbolic variables with associated integer exponents.
    Example: x^2 * y * z^3 is represented as Term([(x, 2), (y, 1), (z, 3)])
    """
    vars: List[Tuple[Var, int]]

    def __init__(self, vars: List[Tuple[Var,int]]) -> None:
        self.vars = vars

    def free_vars(self) -> Set[Var]:
        return set(var for var, _ in self.vars)

    def __repr__(self) -> str:
        vs = []
        for v, c in self.vars:
            if c == 1:
                vs.append(f'{v}')
            else:
                vs.append(f'{v}^{c}')
        return '⋅'.join(vs)

    def __mul__(self, other: 'Term') -> 'Term':
        """Return the product of two terms, combining exponents.

        Example: (x^2 * y) * (y^3 * z) = x^2 * y^4 * z
        Boolean variables are treated idempotently (x^2 = x), ensuring their
        exponent isreduced to 1 when multiplying.
        """
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

    def __lt__(self, other: 'Term') -> bool:
        """Compare terms lexicographically by variable name and exponent"""
        if len(self.vars) != len(other.vars):
            return len(self.vars) < len(other.vars)
        for (v1, c1), (v2, c2) in zip(sorted(self.vars), sorted(other.vars)):
            if v1 != v2: return v1 < v2
            if c1 != c2: return c1 < c2
        return False

    def substitute(self, var_map: Dict[Var, Union[float, complex, 'Fraction']]) -> Tuple[Union[float, complex, 'Fraction'], 'Term']:
        """Evaluate variables present in ``var_map`` and return residual term.

        The method extracts the numerical coefficient contributed by
        substituted variables and returns both the coefficient and a new term
        containing only the untouched variables. This is a building block for
        partial evaluation of polynomials.

        Example: substituting {x: 2} in x^2*y^3 gives (4, Term([(y, 3)]))
        """
        coeff: Union[float, complex, 'Fraction'] = 1.
        new_vars = []
        for v, c in self.vars:
            if v in var_map:
                coeff *= var_map[v] ** c
            else:
                new_vars.append((v, c))
        return (coeff, Term(new_vars))

    def rebind_variables_to_registry(self, new_registry: VarRegistry) -> None:
        """Rebind all variables in this term to the given registry."""
        for var, _ in self.vars:
            var.rebind_to_registry(new_registry)


class Poly:
    """Multivariate polynomials with integer, float, fractional, or complex coefficients.
    Each polynomial is stored as a list of (coefficient, Term) pairs.
    These polynomials encode spider phases as multiples of π, so a constant 1 means a phase of π.

    Example: 3*x^2*y + (1/2)*y*z + 5 is represented as
    Poly([(3, Term([(x,2),(y,1)])), (1/2, Term([(y,1),(z,1)])), (5, Term([]))])
    """
    terms: List[Tuple[Union[int, float, complex, Fraction], Term]]

    def __init__(self, terms: List[Tuple[Union[int, float, complex, Fraction], Term]]) -> None:
        self.terms = terms

    def free_vars(self) -> Set[Var]:
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

    def __truediv__(self, other: Union['Poly', Fraction, int, float, complex]) -> 'Poly':
        if isinstance(other, (int, float, complex, Fraction)):
            other = Poly([(other, Term([]))])
        if len(other.terms) == 0:
            raise ZeroDivisionError("division by zero")
        quotient = Poly([])
        while len(self.terms) > 0 and self.degree >= other.degree:
            leading_term_dividend = sorted(self.terms)[0][1]
            leading_term_divisor = sorted(other.terms)[0][1]
            coeff = sorted(self.terms)[0][0] / sorted(other.terms)[0][0]
            new_term_quotient_vars = [(var, exp - dict(leading_term_divisor.vars).get(var, 0)) for var, exp in leading_term_dividend.vars]
            new_term_quotient = (coeff, Term(new_term_quotient_vars))
            quotient.terms.append(new_term_quotient)
            self -= other * Poly([new_term_quotient])
        return quotient

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
                ts.append(f'{c}⋅{t}')
        return ' + '.join(ts)

    def __eq__(self, other: object) -> bool:
        if isinstance(other, (int, float, Fraction)):
            if other == 0:
                other = Poly([])
            else:
                other = Poly([(other, Term([]))])
        if not isinstance(other, Poly): return False
        return set(self.terms) == set(other.terms)

    def __lt__(self, other: Union['Poly', Fraction, int, float, complex]) -> bool:
        if isinstance(other, (int, float, complex, Fraction)):
            other = Poly([(other, Term([]))])
        if len(self.terms) != len(other.terms):
            return len(self.terms) < len(other.terms)
        for (c1, t1), (c2, t2) in zip(sorted(self.terms), sorted(other.terms)):
            if t1 != t2: return t1 < t2
            if c1 != c2 and not isinstance(c1, complex) and not isinstance(c2, complex):
                return c1 < c2
        return False

    def __le__(self, other: Union['Poly', Fraction, int, float, complex]) -> bool:
        return self == other or self < other

    def __gt__(self, other: Union['Poly', Fraction, int, float, complex]) -> bool:
        return not self <= other

    def __ge__(self, other: Union['Poly', Fraction, int, float, complex]) -> bool:
        return not self < other

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
        """Check if the polynomial is a Pauli polynomial.
        A Pauli polynomial is one where all variables are Boolean and all
        coefficients are integers.
        """
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
        """Check if the polynomial is a Clifford polynomial.
        A Clifford polynomial is one where all variables are Boolean and all
        coefficients are half-integers (i.e. integer multiples of 1/2).
        """
        for c, t in self.terms:
            if isinstance(c, complex):
                return False
            if not all(v.is_bool for v, _ in t.vars):
                return False
            if t.vars: # Contains a Boolean variable
               if c*2 % 1 != 0: # With coefficient not an integer multiple of 1/2
                return False
            else:
                if c*2 % 1 != 0: # Variable-free term with coefficient not an integer multiple of 1/2
                    return False
        return True

    @property
    def numerator(self) -> int:
        raise NotImplementedError('numerator not implemented for symbolic Poly')

    @property
    def denominator(self) -> int:
        raise NotImplementedError('denominator not implemented for symbolic Poly')

    def copy(self) -> 'Poly':
        """Return a shallow copy of the polynomial."""
        return Poly([(c, t) for c, t in self.terms])

    def rebind_variables_to_registry(self, new_registry: VarRegistry) -> None:
        """Rebind all variables in this polynomial to the given registry."""
        for _, term in self.terms:
            term.rebind_variables_to_registry(new_registry)

    def substitute(self, var_map: Dict[Var, Union[float, complex, 'Fraction']]) -> 'Poly':
        """Partially evaluate the polynomial with the provided variable values."""
        p = Poly([])
        for c, t in self.terms:
            coeff, term = t.substitute(var_map)
            p += Poly([(c * coeff, term)])
        return p

def new_var(name: str, is_bool: bool, registry: Optional[VarRegistry] = None) -> Poly:
    """Create a polynomial consisting of a single symbolic variable."""
    return Poly([(1, Term([(Var(name, is_bool, registry), 1)]))])

def new_const(coeff: Union[int, Fraction]) -> Poly:
    """Create a constant polynomial with the given coefficient."""
    return Poly([(coeff, Term([]))])


poly_grammar = Lark("""
    start      : expr
    ?expr      : expr "+" term   -> add
               | expr "-" term   -> sub
               | term
    term       : neg_term | pos_term
    neg_term   : "-" pos_term
    pos_term   : factor ("*"? factor)*
    ?factor    : base ("^" exponent)?
    base       : intf | frac | decimal | pi | pifrac | var | "(" expr ")"
    exponent   : intf
    var        : CNAME
    intf       : INT
    decimal    : DECIMAL
    pi         : "\\pi" | "pi"
    frac       : INT "/" INT
    pifrac     : [INT] pi "/" INT

    %import common.INT
    %import common.DECIMAL
    %import common.CNAME
    %import common.WS
    %ignore WS
    """,
    parser='lalr',
    maybe_placeholders=True)

class PolyTransformer(Transformer):
    """Lark transformer that builds :class:`Poly` instances from parse trees.
    The parse trees are built using the grammar defined in `poly_grammar`.
    It is used in the `parse` function below to convert a string into a Poly.
    """
    def __init__(self, new_var: Callable[[str], Poly]):
        super().__init__()
        self._new_var = new_var

    def start(self, items: List[Any]) -> Poly:
        return items[0]

    def add(self, items: List[Any]) -> Poly:
        return items[0] + items[1]

    def sub(self, items: List[Any]) -> Poly:
        return items[0] - items[1]

    def term(self, items: List[Any]) -> Poly:
        return items[0]

    def neg_term(self, items: List[Any]) -> Poly:
        return -items[0]  # Negate the pos_term

    def pos_term(self, items: List[Any]) -> Poly:
        return reduce(mul, items)

    def factor(self, items: List[Any]) -> Poly:
        if len(items) == 1:
            return items[0]
        # Handle exponentiation: base^exponent
        base = items[0]
        exponent = items[1]
        return base ** exponent

    def base(self, items: List[Any]) -> Poly:
        return items[0]

    def exponent(self, items: List[Any]) -> int:
        return items[0].terms[0][0]

    def var(self, items: List[Any]) -> Poly:
        v = str(items[0])
        return self._new_var(v)

    def pi(self, _: List[Any]) -> Poly:
        return new_const(1)

    def intf(self, items: List[Any]) -> Poly:
        return new_const(int(items[0]))

    def decimal(self, items: List[Any]) -> Poly:
        return new_const(Fraction(float(items[0])).limit_denominator())

    def frac(self, items: List[Any]) -> Poly:
        return new_const(Fraction(int(items[0]), int(items[1])))

    def pifrac(self, items: List[Any]) -> Poly:
        numerator = int(items[0]) if items[0] else 1
        return new_const(Fraction(numerator, int(items[2])))

def parse(expr: str, new_var: Callable[[str], Poly]) -> Poly:
    """Parse ``expr`` into a :class:`Poly` using ``new_var`` for variable lookup.
    It converts the string expression into a polynomial.
    Example: parse("x^2 + 3*y + 1/2", new_var) returns Poly([(1, Term([(x,2)])), (3, Term([(y,1)])), (1/2, Term([]))])
    """
    tree = poly_grammar.parse(expr)
    return PolyTransformer(new_var).transform(tree)
