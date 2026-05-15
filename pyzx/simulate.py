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


# Nothing in this file will make sense if you haven't read Section IV of
# https://journals.aps.org/prx/pdf/10.1103/PhysRevX.6.021043
# In particular the text below equation (10) and equation (11) itself.

################################################################
#                       DEPRECATED FILE                        #
#               Use pyzx/simulation/... instead                #
################################################################

from .simulation import Decomp, Strategy, apply_decomp, full_decompose
from .simulation import common
from .simulation.common import SumGraph
import warnings
from typing import List
from . import simplify
from .graph.base import BaseGraph,VT,ET

def calculate_path_sum(g: BaseGraph[VT,ET]) -> complex:
    warnings.warn(("pyzx.simulate.calculate_path_sum(g) is deprecated. Use pyzx.simulation.common.calculate_path_sum(g) instead."),DeprecationWarning,stacklevel=2)
    return common.calculate_path_sum(g)

def find_stabilizer_decomp(g: BaseGraph[VT,ET]) -> List[BaseGraph[VT,ET]]:
    warnings.warn(("pyzx.simulate.find_stabilizer_decomp(g) is deprecated. Use pyzx.simulation.full_decompose(Strategy.BSS,g) instead."),DeprecationWarning,stacklevel=2)
    return full_decompose(Strategy.BSS,g)

def max_terms_needed(g: BaseGraph[VT,ET]) -> int:
    """Returns the maximum amount of stabilizer terms that g could be split in
    by :func:``find_stabilizer_decomp``."""
    warnings.warn(("pyzx.simulate.max_terms_needed(g) is deprecated. This assumes the BSS decomposition strategy of Kissinger and van de Wetering, 2021."),DeprecationWarning,stacklevel=2)
    v = simplify.tcount(g)
    count = 7**(v//6)
    v -= 6*(v//6)
    if v == 5: return count*8
    if v in (4,3): return count*4
    if v in (2,1): return count*2
    return count

def cut_vertex(g,v):
    warnings.warn(("pyzx.simulate.cut_vertex(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CUT_VERTEX,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CUT_VERTEX,g,v)

def cut_edge(g,e,ty=1):
    warnings.warn(("pyzx.simulate.cut_edge(g,e,ty) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CUT_EDGE,g,e,ty) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CUT_EDGE,g,e,ty)

def cut_wishbone(g,v,neighs,ph):
    warnings.warn(("pyzx.simulate.cut_wishbone(g,v,neighs,ph) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CUT_WISHBONE,g,v,neighs,ph) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CUT_WISHBONE,g,v,neighs,ph)

def gen_catlike_term(g_initial: BaseGraph[VT, ET],
                     vertices: List[VT],
                     ph_base,
                     ph_central,
                     ph_appendix,
                     eType_base,
                     eType_appendix,
                     scal_positive,
                     scal_power,
                     scal_phase,
                     pi_case: bool = False) -> BaseGraph[VT, ET]:
    warnings.warn(("pyzx.simulate.gen_catlike_term(...) is deprecated. Use pyzx.simulation.common.gen_catlike_term(...) instead."),DeprecationWarning,stacklevel=2)
    return common.gen_catlike_term(g_initial,vertices,ph_base,ph_central,ph_appendix,eType_base,eType_appendix,scal_positive,scal_power,scal_phase,pi_case)

def check_catn(g: BaseGraph[VT, ET], vertex: VT, n: int) -> bool:
    warnings.warn(("pyzx.simulate.check_catn(g,v,n) is deprecated. Use pyzx.simulation.common.check_catn(g,v,n) instead."),DeprecationWarning,stacklevel=2)
    return common.check_catn(g,vertex,n)

def apply_magic5(g: BaseGraph[VT,ET], verts: List[VT]) -> SumGraph:
    warnings.warn(("pyzx.simulate.apply_magic5(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.MAGIC_5,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.MAGIC_5,g,verts)

def apply_cat3(g: BaseGraph[VT, ET], vertex: VT) -> SumGraph:
    warnings.warn(("pyzx.simulate.apply_cat3(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CAT_3,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CAT_3,g,vertex)

def apply_cat4(g: BaseGraph[VT, ET], vertex: VT) -> SumGraph:
    warnings.warn(("pyzx.simulate.apply_cat4(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CAT_4,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CAT_4,g,vertex)

def apply_cat5(g: BaseGraph[VT, ET], vertex: VT) -> SumGraph:
    warnings.warn(("pyzx.simulate.apply_cat5(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CAT_5,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CAT_5,g,vertex)

def apply_cat6(g: BaseGraph[VT, ET], vertex: VT) -> SumGraph:
    warnings.warn(("pyzx.simulate.apply_cat6(g,v) is deprecated. Use pyzx.simulation.apply_decomp(Decomp.CAT_6,g,v) instead."),DeprecationWarning,stacklevel=2)
    return apply_decomp(Decomp.CAT_6,g,vertex)