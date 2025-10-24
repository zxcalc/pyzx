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

from .color_change_rule import color_change_diagram, check_color_change, color_change, unsafe_color_change
from .bialgebra_rule    import bialgebra, check_bialgebra, check_bialgebra_reduce, unsafe_bialgebra
from .fuse_rule         import check_fuse, fuse, unfuse, unsafe_fuse
from .remove_id_rule    import check_remove_id, remove_id,  unsafe_remove_id
from .copy_rule         import check_copy, copy, unsafe_copy
from .z_to_z_box_rule   import z_to_z_box, check_z_to_z_box, unsafe_z_to_z_box
from .pivot_rule        import pivot, check_pivot_parallel, unsafe_pivot
from .lcomp_rule        import lcomp, check_lcomp, unsafe_lcomp
from .hopf_rule         import hopf, check_hopf, unsafe_hopf
from .self_loops_rule   import remove_self_loop, check_self_loop, unsafe_remove_self_loop
from .add_identity_rule import check_edge, add_Z_identity, unsafe_add_Z_identity
from .push_pauli_rule   import check_pauli, pauli_push, unsafe_pauli_push
from .euler_rule        import check_hadamard_edge, euler_expansion, unsafe_euler_expansion
from .pi_commute_rule   import check_pi_commute, pi_commute, unsafe_pi_commute


__all__ = ['color_change_diagram',
           'check_color_change',
           'color_change',
           'unsafe_color_change',
           'check_bialgebra_reduce',
           'check_bialgebra',
           'bialgebra',
           'unsafe_bialgebra',
           'check_fuse',
           'fuse',
           'unfuse',
           'unsafe_fuse',
           'check_remove_id',
           'remove_id',
           'unsafe_remove_id',
           'check_copy',
           'copy',
           'unsafe_copy',
           'z_to_z_box',
           'unsafe_z_to_z_box',
           'check_z_to_z_box',
           'check_pivot_parallel',
           'pivot',
           'unsafe_pivot',
           'check_lcomp',
           'lcomp',
           'unsafe_lcomp',
           'hopf',
           'unsafe_hopf',
           'check_hopf',
           'check_self_loop',
           'remove_self_loop',
           'unsafe_remove_self_loop',
           'check_edge',
           'add_Z_identity',
           'unsafe_add_Z_identity',
           'check_pauli',
           'pauli_push',
           'unsafe_pauli_push',
           'check_hadamard_edge',
           'euler_expansion',
           'unsafe_euler_expansion',
           'check_pi_commute',
           'pi_commute',
           'unsafe_pi_commute'
           ]