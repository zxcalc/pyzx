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

"""
Used for ZX-live
"""

import json
from pyzx.rewrite_rules import *

MATCHES_VERTICES = 1
MATCHES_EDGES = 2

operations = {
    "spider": {"text": "fuse spiders", 
               "tooltip": "Fuses connected spiders of the same color",
               "matcher": check_fuse,
               "rule": fuse,
               "type": MATCHES_VERTICES},
    "to_z": {"text": "change color to Z", 
               "tooltip": "Changes X spiders into Z spiders by pushing out Hadamards",
               "matcher": check_color_change,
               "rule": color_change,
               "type": MATCHES_VERTICES},
    "to_x": {"text": "change color to X", 
               "tooltip": "Changes Z spiders into X spiders by pushing out Hadamards",
               "matcher": check_color_change,
               "rule": color_change,
               "type": MATCHES_VERTICES},
    "rem_id": {"text": "remove identity", 
               "tooltip": "Removes a 2-ary phaseless spider",
               "matcher": check_remove_id,
               "rule": remove_id,
               "type": MATCHES_VERTICES},
    "id_z": {"text": "Add Z identity", 
               "tooltip": "Adds a phaseless arity 2 Z spider on the selected edges",
               "matcher": check_edge,
               "rule": add_Z_identity,
               "type": MATCHES_EDGES},
    "z_to_z_box": {"text": "Convert Z-spider to Z-box",
                "tooltip": "Converts a Z-spider into a Z-box",
                "matcher": check_z_to_z_box,
                "rule": z_to_z_box,
                "type": MATCHES_VERTICES},
    "hopf": {"text": "Hopf rule",
             "tooltip": "Applies the Hopf rule between pairs of spiders that share parallel edges",
             "matcher": check_hopf,
             "rule": hopf,
             "type": MATCHES_VERTICES},
    "remove_self_loops": {"text": "remove self-loops",
                        "tooltip": "Removes all self-loops on a spider",
                        "matcher": check_self_loop,
                        "rule": remove_self_loop,
                        "type": MATCHES_VERTICES},
    "had2edge": {"text": "Convert H-box", 
               "tooltip": "Converts an arity 2 H-box into an H-edge.",
               "matcher": check_hadamard,
               "rule": replace_hadamard,
               "type": MATCHES_VERTICES},
    "fuse_hbox": {"text": "Fuse H-boxes", 
               "tooltip": "Merges two adjacent H-boxes together",
               "matcher": check_connected_hboxes,
               "rule": fuse_hboxes,
               "type": MATCHES_EDGES},
    "mult_hbox": {"text": "Multiply H-boxes", 
               "tooltip": "Merges groups of H-boxes that have the same connectivity",
               "matcher": check_par_hbox_for_simp,
               "rule": par_hbox,
               "type": MATCHES_VERTICES},
    "fuse_w": {"text": "fuse W nodes",
               "tooltip": "Merges two connected W nodes together",
               "matcher": check_fuse,
                "rule": fuse,
                "type": MATCHES_EDGES},
    "copy": {"text": "copy 0/pi spider", 
               "tooltip": "Copies a single-legged spider with a 0/pi phase through its neighbor",
               "matcher": check_copy,
               "rule": copy,
               "type": MATCHES_VERTICES},
    "pauli": {"text": "push Pauli", 
               "tooltip": "Pushes an arity 2 pi-phase through a selected neighbor",
               "matcher": check_pauli,
               "rule": pauli_push,
               "type": MATCHES_VERTICES},
    "euler": {"text": "decompose Hadamard", 
               "tooltip": "Expands a Hadamard-edge into its component spiders using its Euler decomposition",
               "matcher": check_hadamard_edge,
               "rule": euler_expansion,
               "type": MATCHES_EDGES},
    "lcomp": {"text": "local complementation", 
               "tooltip": "Deletes a spider with a pi/2 phase by performing a local complementation on its neighbors",
               "matcher": check_lcomp,
               "rule": lcomp,
               "type": MATCHES_VERTICES},
    "pivot": {"text": "pivot", 
               "tooltip": "Deletes a pair of spiders with 0/pi phases by performing a pivot",
               "matcher": check_pivot,
               "rule": pivot,
               "type": MATCHES_EDGES}
}


def operations_to_js() -> str:
    global operations
    return json.dumps({k:
            {"active":False, 
             "text":v["text"], 
             "tooltip":v["tooltip"]
            } for k,v in operations.items()})
