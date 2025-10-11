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

from .color_change_rule import color_change_diagram, check_color_change, color_change
from .bialgebra_rule    import bialgebra, unsafe_bialgebra, check_bialgebra, check_bialgebra_reduce
from .fuse_rule         import check_fuse, fuse, check_fuse_w, fuse_w, unsafe_fuse_w, unsafe_fuse, unfuse
from .remove_id_rule    import check_remove_id, remove_id, unsafe_remove_id, check_remove_id_w, remove_id_w, unsafe_remove_id_w
from .copy_rule         import check_copy, copy, unsafe_copy

__all__ = ['color_change_diagram',
           'check_color_change',
           'color_change',
           'check_bialgebra_reduce',
           'check_bialgebra',
           'bialgebra',
           'unsafe_bialgebra',
           'check_fuse',
           'fuse',
           'unsafe_fuse',
           'check_fuse_w',
           'fuse_w',
           'unsafe_fuse_w',
           'unfuse',
           'check_remove_id',
           'remove_id',
           'unsafe_remove_id',
           'check_remove_id_w',
           'remove_id_w',
           'unsafe_remove_id_w',
           'check_copy',
           'copy',
           'unsafe_copy',
        'check_copy_X',
        'copy_X',
        'check_copy_Z',
        'copy_Z',
        'check_pi_commute_X',
        'pi_commute_X',
        'check_pi_commute_Z',
        'pi_commute_Z',
        'check_remove_id',
        'remove_id']