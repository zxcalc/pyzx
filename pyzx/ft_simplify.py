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

"""This file is structured the same way as `simplify.py`, but instead contains
simplifications with using only fault-equivalent rewrites"""

from pyzx.rewrite import RewriteSimpSingleVertex, RewriteSimpGraph
from pyzx.rewrite_rules.fuse_1_FE_rule import *
from pyzx.rewrite_rules.unfuse_FE_rules import *
from pyzx.rewrite_rules.fuse_FE_rules import *
from pyzx.rewrite_rules.remove_id_rule import *
from pyzx.ft_rewrite import RewriteSimpSingleVertex_ft


elim_FE_simp = RewriteSimpSingleVertex(check_remove_id, unsafe_remove_id)
"""Performs an Elim rewrite. Can be run automatically on the entire graph."""

fuse_1_FE_simp = RewriteSimpSingleVertex(check_fuse_1_FE, unsafe_fuse_1_FE)
"""Performs a Fuse-1 rewrite. Can be run automatically on the entire graph."""

unfuse_1_FE_simp = RewriteSimpSingleVertex(check_unfuse_1_FE, unsafe_unfuse_1_FE)
"""Performs a Unfuse-1 rewrite. Can be run automatically on the entire graph."""

unfuse_4_FE_simp = RewriteSimpSingleVertex(check_unfuse_4_FE, unsafe_unfuse_4_FE)
"""Performs a Unfuse-4 rewrite. Can be run automatically on the entire graph."""

unfuse_5_FE_simp = RewriteSimpSingleVertex(check_unfuse_5_FE, unsafe_unfuse_5_FE)
"""Performs a Unfuse-5 rewrite. Can be run automatically on the entire graph."""

unfuse_n_2FE_simp = RewriteSimpSingleVertex(check_unfuse_n_2FE, unsafe_unfuse_n_2FE)
"""Performs a Unfuse-n rewrite. Can be run automatically on the entire graph."""

unfuse_2n_FE_simp = RewriteSimpSingleVertex_ft(check_unfuse_2n_FE, unsafe_unfuse_2n_FE)
"""Performs a Unfuse-2n rewrite. Can be run automatically on the entire graph."""

unfuse_2n_plus_FE_simp = RewriteSimpSingleVertex_ft(check_unfuse_2n_plus_FE, unsafe_unfuse_2n_plus_FE)
"""Performs a Unfuse-2n^+ rewrite. Can be run automatically on the entire graph."""

recursive_unfuse_FE_simp = RewriteSimpSingleVertex_ft(check_recursive_unfuse_FE, unsafe_recursive_unfuse_FE)
"""Performs a recursive unfusion rewrite. Can be run automatically on the entire graph."""

fuse_4_FE_simp = RewriteSimpGraph(safe_fuse_4_FE, simp_fuse_4_FE)
"""Performs a fuse-4 rewrite. Can be run automatically on the entire graph."""
fuse_4_FE_simp.is_match = is_fuse_4_match # type: ignore