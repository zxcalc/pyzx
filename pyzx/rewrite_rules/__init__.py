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

from .color_change_rule         import *
from .bialgebra_rule            import *
from .fuse_rule                 import *
from .remove_id_rule            import *
from .copy_rule                 import *
from .z_to_z_box_rule           import *
from .pivot_rule                import *
from .lcomp_rule                import *
from .hopf_rule                 import *
from .self_loops_rule           import *
from .add_identity_rule         import *
from .push_pauli_rule           import *
from .euler_rule                import *
from .pi_commute_rule           import *
from .hbox_not_remove_rule      import *
from .zero_hbox_rule            import *
from .fuse_hboxes_rule          import *
from .had_edge_hbox_rule        import *
from .hpivot_rule               import *
from .merge_phase_gadget_rule   import *
from .supplementarity_rule      import *
from .gadget_phasepoly_rule     import *
from .par_hbox_rule             import *