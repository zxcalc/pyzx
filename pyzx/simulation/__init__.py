from .decompositions import Decomp, apply_decomp, check_valid, get_alpha, get_decomp_spec
from .strategies import Strategy, full_decompose, simulate, get_strategy_spec
from .decompositions import get_reference as _get_decomp_reference
from .strategies import get_reference as _get_strategy_reference

def get_reference(kind:Decomp|Strategy) -> str:
    if type(kind) == Decomp:
        return _get_decomp_reference(kind)
    elif type(kind) == Strategy:
        return _get_strategy_reference(kind)
    else:
        raise TypeError(f"function get_reference requires argument of type {Decomp} or {Strategy}, not {type(kind)}.")

__all__ = [
    "Decomp",
    "apply_decomp",
    "check_valid",
    "get_alpha",
    "get_decomp_spec",

    "Strategy",
    "full_decompose",
    "simulate",
    "get_strategy_spec",

    "get_reference"
]