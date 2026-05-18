"""
This file handles the overhead for managing decomposition strategies. See pyzx.simulation.__init__.py for details on how to add
a new decomposition strategy. 
"""

from enum import Enum
from typing import Callable, List
from ...graph.base import BaseGraph,VT,ET

class Strategy(Enum):
    BSS = "bss"
    CUT_RANDOM = "cut_random"

class StrategySpec:
    def __init__(self, fn:Callable|None=None, reference:str="") -> None:
        self.fn = fn
        self.reference = reference

_REGISTRY: dict[Strategy,StrategySpec] = {} # this stores all the loaded decomposition strategies, indexable by their enum names

def simulate(kind:Strategy, g:BaseGraph[VT,ET], *args, **kwargs) -> complex:
    """Runs full_decompose and sums the resulting scalars to return the probability amplitude.
    
    Args:
        kind: The decomposition strategy to use, e.g. Strategy.BSS.
        g: The graph to decompose.
        *args, **kwargs: Potential additional decomposition-specific arguments

    Returns:
        A complex scalar equal to the probability amplitude of the graph g.
    """
    terms = full_decompose(kind, g, *args, **kwargs)
    return sum(g.scalar.to_number() for g in terms) # todo - avoid using .to_number() here; also, use a JAX parallel summation perhaps?

def full_decompose(kind:Strategy, g:BaseGraph[VT,ET], *args, **kwargs) -> List[BaseGraph[VT,ET]]: # todo - perhaps beter to return as a SumGraph?
    """Fully decomposes a given graph based on the specified decomposition strategy

    Args:
        kind: The decomposition strategy to use, e.g. Strategy.BSS.
        g: The graph to decompose.
        *args, **kwargs: Potential additional decomposition-specific arguments

    Returns:
        A list of empty scalar graphs whose sum is equivalent to the original graph g.
    """
    if isinstance(kind, str):
        kind = Strategy(kind)
    return get_strategy(kind)(g, *args, **kwargs)

def register_strategy(kind:Strategy, reference:str="") -> Callable:
    """Registers a decomposition strategy.

    This decorator associates a decomposition strategy function with a ``Decomp``
    enum entry and stores its metadata in the decomposition registry.

    When creating a new decomposition strategy (e.g. MY_STRAT) as an e.g. my_strat.py file the simulation/decompositions folder,
    one should include @register_strategy(Strategy.MY_STRAT,...) immediately before defining the function that executes the
    strategy so that this function may be called via simulation.full_decompose(Strategy.MY_STRAT,g,...) and - to also sum the
    resulting scalars - via simulation.simulate(Strategy.MY_STRAT,g,...).

    See simulation.strategies.cut_random.py for a minimal example.

    Args:
        kind: The enum entry of the decomposition strategy being registered.
        reference: Optional literature reference or citation associated with the decomposition strategy.

    Returns:
        A decorator which registers the decorated decomposition strategy function.
    """
    def decorator(fn):
        _REGISTRY[kind] = StrategySpec(fn,reference)
        return fn
    return decorator

def get_strategy(kind:Strategy) -> Callable:
    return _REGISTRY[kind].fn

def get_reference(kind:Strategy) -> str:
    return _REGISTRY[kind].reference

def get_strategy_spec(kind:Strategy) -> StrategySpec:
    return _REGISTRY[kind]

######################################################################
# Import strategy modules so their @register_strategy decorators run #
######################################################################
from . import bss
from . import cut_random