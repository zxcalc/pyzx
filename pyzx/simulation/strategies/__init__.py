from enum import Enum

class Strategy(Enum):
    BSS = "bss"
    CUT_RANDOM = "cut_random"

class StrategySpec:
    def __init__(self, fn=None, reference=""):
        self.fn = fn
        self.reference = reference

_REGISTRY = {}

def simulate(kind, *args, **kwargs):
    """Runs full_decompose and sums the resulting scalars."""
    terms = full_decompose(kind, *args, **kwargs)
    return sum(g.scalar.to_number() for g in terms) # todo - avoid using .to_number() here; also, use a JAX parallel summation perhaps?

def full_decompose(kind, *args, **kwargs):
    """Fully decomposes a given graph based on the specified decomposition strategy, returning a list of (empty scalar) graphs.

    Args:
        kind: The decomposition strategy to use, e.g. Strategy.BSS.
        g: the graph to decompose.
    """
    if isinstance(kind, str):
        kind = Strategy(kind)
    return get_strategy(kind)(*args, **kwargs)

def register_strategy(kind, reference=""):
    def decorator(fn):
        _REGISTRY[kind] = StrategySpec(fn,reference)
        return fn
    return decorator

def get_strategy(kind):
    return _REGISTRY[kind].fn

def get_reference(kind):
    return _REGISTRY[kind].reference

def get_strategy_spec(kind):
    return _REGISTRY[kind]

####################################################################
# Import strategy modules so their @register_decomp decorators run #
####################################################################
from . import bss
from . import cut_random