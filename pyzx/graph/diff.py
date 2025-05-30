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

import copy
import json
from collections import Counter
from typing import Any, Callable, Generic, Optional, List, Dict, Tuple

from ..utils import VertexType, EdgeType, FractionLike, FloatInt, phase_to_s
from .base import BaseGraph, VT, ET
from .graph_s import GraphS
from .jsonparser import string_to_phase

class GraphDiff(Generic[VT, ET]):
    removed_verts: List[VT]
    new_verts: List[VT]
    removed_edges: List[ET]
    new_edges: List[Tuple[Tuple[VT,VT],EdgeType]]
    changed_vertex_types: Dict[VT,VertexType]
    changed_edge_types: Dict[ET, EdgeType]
    changed_phases: Dict[VT, FractionLike]
    changed_pos: Dict[VT, Tuple[FloatInt,FloatInt]]
    changed_vdata: Dict[VT, Any]
    changed_edata: Dict[ET, Any]
    variable_types: Dict[str,bool]

    def __init__(self, g1: BaseGraph[VT,ET], g2: BaseGraph[VT,ET]) -> None:
        self.calculate_diff(g1,g2)

    def calculate_diff(self, g1: BaseGraph[VT,ET], g2: BaseGraph[VT,ET]) -> None:
        self.changed_vertex_types = {}
        self.changed_edge_types = {}
        self.changed_phases = {}
        self.changed_pos = {}
        self.changed_vdata = {}
        self.changed_edata = {}
        self.variable_types = g1.variable_types.copy()
        self.variable_types.update(g2.variable_types)

        old_verts = g1.vertex_set()
        new_verts = g2.vertex_set()
        self.removed_verts = list(old_verts - new_verts)
        self.new_verts = list(new_verts - old_verts)
        old_edges = g1.edge_set()
        new_edges = g2.edge_set()
        self.new_edges = []
        self.removed_edges = []

        for e in Counter(new_edges - old_edges).elements():
            self.new_edges.append((g2.edge_st(e), g2.edge_type(e)))

        for e in Counter(old_edges - new_edges).elements():
            self.removed_edges.append(e)

        for v in new_verts:
            if v in old_verts:
                if g1.type(v) != g2.type(v):
                    self.changed_vertex_types[v] = g2.type(v)
                if g1.phase(v) != g2.phase(v):
                    self.changed_phases[v] = g2.phase(v)
                d1 = g1.vdata_dict(v)
                d2 = g2.vdata_dict(v)
                if d1 != d2:
                    self.changed_vdata[v] = d2
                pos1 = g1.qubit(v), g1.row(v)
                pos2 = g2.qubit(v), g2.row(v)
                if pos1 != pos2:
                    self.changed_pos[v] = pos2
            else: # It is a new vertex
                if g2.type(v) != VertexType.Z: # We are taking the Z type to be the default
                    self.changed_vertex_types[v] = g2.type(v)
                if g2.phase(v) != 0:
                    self.changed_phases[v] = g2.phase(v)
                pos2 = g2.qubit(v), g2.row(v)
                self.changed_pos[v] = pos2

        for e in new_edges:
            if e in old_edges:
                if g1.edge_type(e) != g2.edge_type(e):
                    self.changed_edge_types[e] = g2.edge_type(e)
                d1 = g1.edata_dict(e)
                d2 = g2.edata_dict(e)
                if d1 != d2:
                    self.changed_edata[e] = d2
            else:
                if g2.edge_type(e) != EdgeType.HADAMARD: # We take Hadamard edges to be the default
                    self.changed_edge_types[e] = g2.edge_type(e)
                d2 = g2.edata_dict(e)
                if d2:
                    self.changed_edata[e] = d2

    def apply_diff(self,g: BaseGraph[VT,ET]) -> BaseGraph[VT,ET]:
        g = copy.deepcopy(g)
        g.remove_edges(self.removed_edges)
        g.remove_vertices(self.removed_verts)
        for v in self.new_verts:
            g.add_vertex_indexed(v)
            g.set_position(v,*self.changed_pos[v])
            if v in self.changed_vertex_types:
                g.set_type(v,self.changed_vertex_types[v])
            else:
                g.set_type(v,VertexType.Z)
            if v in self.changed_phases:
                g.set_phase(v,self.changed_phases[v])
            if v in self.changed_vdata:
                g.set_vdata_dict(v, self.changed_vdata[v])
        for st, ty in self.new_edges:
            g.add_edge(st,ty)
        for e in self.changed_edata:
            for k, val in self.changed_edata[e].items():
                g.set_edata(e, k, val)

        for v in self.changed_pos:
            if v in self.new_verts: continue
            g.set_position(v,*self.changed_pos[v])

        for v in self.changed_vertex_types:
            if v in self.new_verts: continue
            g.set_type(v,self.changed_vertex_types[v])

        for v in self.changed_phases:
            if v in self.new_verts: continue
            g.set_phase(v,self.changed_phases[v])

        for v in self.changed_vdata:
            if v in self.new_verts: continue
            g.set_vdata_dict(v, self.changed_vdata[v])

        for e in self.changed_edge_types:
            g.set_edge_type(e,self.changed_edge_types[e])

        return g

    def to_dict(self) -> Dict[str, Any]:
        changed_edge_types_str_dict = {}
        for key, value in self.changed_edge_types.items():
            changed_edge_types_str_dict[f"{key[0]},{key[1]}"] = value # type: ignore
        changed_edata_str_dict = {}
        for key, value in self.changed_edata.items():
            changed_edata_str_dict[f"{key[0]},{key[1]}"] = value # type: ignore
        changed_phases_str = {k: phase_to_s(v) for k, v in self.changed_phases.items()}
        return {
            "removed_verts": self.removed_verts,
            "new_verts": self.new_verts,
            "removed_edges": self.removed_edges,
            "new_edges": self.new_edges,
            "changed_vertex_types": self.changed_vertex_types,
            "changed_edge_types": changed_edge_types_str_dict,
            "changed_phases": changed_phases_str,
            "changed_pos": self.changed_pos,
            "changed_vdata": self.changed_vdata,
            "changed_edata": changed_edata_str_dict,
            "variable_types": self.variable_types
        }

    def to_json(self) -> str:
        return json.dumps(self.to_dict())

    @staticmethod
    def from_json(json_str: str) -> "GraphDiff":
        d = json.loads(json_str)
        gd = GraphDiff(GraphS(),GraphS())
        gd.removed_verts = d["removed_verts"]
        gd.new_verts = d["new_verts"]
        gd.removed_edges = list(map(tuple, d["removed_edges"])) # type: ignore
        gd.new_edges = list(map(tuple, d["new_edges"])) # type: ignore
        gd.changed_vertex_types = map_dict_keys(d["changed_vertex_types"], int)
        gd.changed_edge_types = map_dict_keys(d["changed_edge_types"], lambda x: tuple(map(int, x.split(","))))
        gd.changed_phases = {int(k): string_to_phase(v,gd) for k, v in d["changed_phases"].items()}
        gd.changed_pos = map_dict_keys(d["changed_pos"], int)
        gd.changed_vdata = map_dict_keys(d["changed_vdata"], int)
        if "changed_edata" in d:
            gd.changed_edata = map_dict_keys(d["changed_edata"], lambda x: tuple(map(int, x.split(","))))
        else:
            gd.changed_edata = {}
        return gd

def map_dict_keys(d: Dict[str, Any], f: Callable[[str], Any]) -> Dict[Any, Any]:
    return {f(k): v for k, v in d.items()}
