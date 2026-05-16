from enum import Enum
import inspect
import warnings
from typing import Callable
from ..common import SumGraph

class Decomp(Enum):
    BSS          = "bss"
    CAT_3        = "cat_3"
    CAT_4        = "cat_4"
    CAT_5        = "cat_5"
    CAT_6        = "cat_6"
    CAT_N        = "cat_n"
    MAGIC_5      = "magic_5"
    MAGIC_2      = "magic_2"
    CUT_EDGE     = "cut_edge"
    CUT_VERTEX   = "cut_vertex"
    CUT_WISHBONE = "cut_wishbone"

class DecompSpec:
    def __init__(self, fn:Callable|None=None, validation_fn:Callable|None=None, alpha:float|None=None, reference:str=""):
        self.fn = fn
        self.validation_fn = validation_fn
        self.alpha = alpha
        self.reference = reference

_REGISTRY = {}

def apply_decomp(kind:Decomp, *args, **kwargs) -> SumGraph:
    """Applies an instance of the specified decomposition to the provided graph with the decomposition-specific arguments."""
    if isinstance(kind, str):
        kind = Decomp(kind)
    
    validity_fn = get_validity_checker(kind)
    decomp_fn   = get_decomp(kind)
    if (validity_fn is not None and not validity_fn(*args, **kwargs)):
        # Each decomposition's validity checker function should provide its own, more specific, error messages.
        # But this generic error message is included as a backup in case a decomposition is added whose validity checker simply returns false.
        raise RuntimeError(f"Invalid application of decomposition {kind} with args={args} and kwargs={kwargs}.")
    return decomp_fn(*args, **kwargs)

def check_valid(kind:Decomp, *args, **kwargs) -> bool:
    validity_fn = get_validity_checker(kind)
    if (validity_fn is not None):
        return validity_fn(*args, **kwargs)
    else:
        warnings.warn(
            f"Unable to validate as decomposition {kind} has no validity checker function. Assumed valid.",
            RuntimeWarning,
            stacklevel=2,
        )
    return True

def _get_or_create_spec(kind:Decomp):
    if kind not in _REGISTRY:
        _REGISTRY[kind] = DecompSpec()
    return _REGISTRY[kind]

def register_decomp(kind:Decomp, alpha:float|None=None, reference:str=""):
    def decorator(fn):
        spec = _get_or_create_spec(kind)
        spec.fn = fn
        _check_signatures_match(kind,spec)
        spec.alpha = alpha
        spec.reference = reference
        return fn
    return decorator

def register_validity_checker(kind:Decomp):
    def decorator(fn):
        spec = _get_or_create_spec(kind)
        spec.validation_fn = fn
        _check_signatures_match(kind,spec)
        return fn
    return decorator

def _check_signatures_match(kind:Decomp,spec):
    if spec.fn is not None and spec.validation_fn is not None and not (inspect.signature(spec.fn).parameters == inspect.signature(spec.validation_fn).parameters):
        raise TypeError(
            f"Signature parameters mismatch for decomposition {kind}. "
            f"Decompose function has signature {inspect.signature(spec.fn)}, "
            f"but validity checker function has signature {inspect.signature(spec.validation_fn)}."
        )
    return True

def get_decomp(kind:Decomp):
    return _REGISTRY[kind].fn

def get_validity_checker(kind:Decomp):
    return _REGISTRY[kind].validation_fn

def get_alpha(kind:Decomp):
    return _REGISTRY[kind].alpha

def get_reference(kind:Decomp):
    return _REGISTRY[kind].reference

def get_decomp_spec(kind:Decomp):
    return _REGISTRY[kind]

#########################################################################
# Import decomposition modules so their @register_decomp decorators run #
#########################################################################
from . import bss
from . import cat_3
from . import cat_4
from . import cat_5
from . import cat_6
from . import cat_n
from . import magic_5
from . import magic_2
from . import cut_edge
from . import cut_vertex
from . import cut_wishbone