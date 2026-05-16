"""Classical simulation framework.

This module provides an extensible and modular framework for classical simulation techniques based on stabiliser decompositions.

It is organised into several submodules:

- ``decompositions``:
  Individual decomposition rules, such as BSS, magic-state decompositions, edge cuts, and vertex cuts.

- ``strategies``:
  Higher-level decomposition strategies which recursively apply decompositions to fully reduce diagrams.

- ``simulation``:
  User-facing simulation API and helper utilities.

To include a new decomposition, create a new file simulation/decompositions/{decomp_name}.py and follow the existing decompositions
as a template (cat_3.py provides a very minimal example). Ensure the decomposition is provided relevant metadata, namely an enum
name, an alpha efficiency value if applicable (or None) and a comma-separated string of links to any relevant publications. It must
also include a function for applying the decomposition, decorated via @register_decomp, and (optionally but highly recommended) a
function for checking if an attempted instance of applying the decomposition is valid, decorated via @register_validity_checker.
After adding a decomposition, ensure its enum name is included atop simulation/decompositions/__init__.py and its file is imported
at the bottom.

Likewise, to add a new decomposition strategy, create a new file simulation/strategies/{strat_name}.py and follow the existing
strategies as a template (such as the very minimal cut_random.py). Strategies also require an enum and (if applicable) a reference,
as well as a function to execute the strategy to a given graph, decoarated via @register_strategy. After adding a strategy,
ensure its enum name is included atop simulation/strategies/__init__.py and its file is imported at the bottom.
"""

from .decompositions import Decomp, apply_decomp, check_valid, get_alpha, get_decomp_spec
from .strategies import Strategy, full_decompose, simulate, get_strategy_spec
from .decompositions import get_reference as _get_decomp_reference
from .strategies import get_reference as _get_strategy_reference

def get_reference(kind:Decomp|Strategy) -> str:
    """Returns a string listing any relevant links to publications associated with the specified decomposition or strategy.
    """
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
