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


import unittest
from fractions import Fraction
import json
import sys
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.graph import Graph
from pyzx.graph.scalar import Scalar
from pyzx.graph.jsonparser import graph_to_dict, dict_to_graph
from pyzx.utils import EdgeType, VertexType, set_h_box_label, get_h_box_label, hbox_has_complex_label
from pyzx.symbolic import Poly, new_var


# A graph in the old format (a Quantomatic .qgraph file)
test_graph_old_format = {'node_vertices': {
                   'v0': {'annotation': {'coord': [1.0, -1.0]},
                          'data': {'type': 'X', 'value': '\\pi'}},
                   'v1': {'annotation': {'coord': [2.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v10': {'annotation': {'coord': [6.0, -2.0]},
                           'data': {'type': 'X'}},
                   'v11': {'annotation': {'coord': [7.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v12': {'annotation': {'coord': [2.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v13': {'annotation': {'coord': [3.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v14': {'annotation': {'coord': [4.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v15': {'annotation': {'coord': [11.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v16': {'annotation': {'coord': [2.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v17': {'annotation': {'coord': [3.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v18': {'annotation': {'coord': [4.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v19': {'annotation': {'coord': [6.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v2': {'annotation': {'coord': [3.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v20': {'annotation': {'coord': [7.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v21': {'annotation': {'coord': [8.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi/2'}},
                   'v22': {'annotation': {'coord': [9.0, -4.15]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v23': {'annotation': {'coord': [10.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v24': {'annotation': {'coord': [11.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v25': {'annotation': {'coord': [13.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v26': {'annotation': {'coord': [16.0, -3.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v27': {'annotation': {'coord': [3.0, -4.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v28': {'annotation': {'coord': [6.0, -4.0]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v29': {'annotation': {'coord': [6.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v3': {'annotation': {'coord': [4.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v30': {'annotation': {'coord': [7.0, -5.0]},
                           'data': {'type': 'X'}},
                   'v31': {'annotation': {'coord': [8.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v32': {'annotation': {'coord': [9.75, -4.975]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v33': {'annotation': {'coord': [2.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v34': {'annotation': {'coord': [3.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v35': {'annotation': {'coord': [4.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v36': {'annotation': {'coord': [1.0, -6.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v37': {'annotation': {'coord': [6.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v38': {'annotation': {'coord': [7.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v39': {'annotation': {'coord': [8.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v4': {'annotation': {'coord': [6.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v40': {'annotation': {'coord': [1.0, -6.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v41': {'annotation': {'coord': [2.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v42': {'annotation': {'coord': [3.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v43': {'annotation': {'coord': [4.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v44': {'annotation': {'coord': [9.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v45': {'annotation': {'coord': [10.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v46': {'annotation': {'coord': [11.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v47': {'annotation': {'coord': [12.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v48': {'annotation': {'coord': [12.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v49': {'annotation': {'coord': [13.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v5': {'annotation': {'coord': [7.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v50': {'annotation': {'coord': [13.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v51': {'annotation': {'coord': [14.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v52': {'annotation': {'coord': [15.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v53': {'annotation': {'coord': [16.0, -2.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v54': {'annotation': {'coord': [17.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v55': {'annotation': {'coord': [14.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v56': {'annotation': {'coord': [15.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v57': {'annotation': {'coord': [16.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v58': {'annotation': {'coord': [17.0, -5.0]},
                           'data': {'type': 'X', 'value': '\\pi'}},
                   'v59': {'annotation': {'coord': [1.0, -2.0]},
                           'data': {'type': 'Z'}},
                   'v6': {'annotation': {'coord': [8.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v60': {'annotation': {'coord': [1.0, -5.0]},
                           'data': {'type': 'Z'}},
                   'v61': {'annotation': {'coord': [16.0, -1.0]},
                           'data': {'type': 'Z'}},
                   'v62': {'annotation': {'coord': [17.0, -6.0]},
                           'data': {'type': 'Z'}},
                   'v63': {'annotation': {'coord': [9.75374984741211,
                                                    -4.166666793823242]},
                           'data': {'is_edge': 'false',
                                    'type': 'hadamard',
                                    'value': '\\pi'}},
                   'v7': {'annotation': {'coord': [9.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v8': {'annotation': {'coord': [10.0, -1.0]},
                          'data': {'type': 'Z'}},
                   'v9': {'annotation': {'coord': [5.0, -2.0]},
                          'data': {'type': 'Z'}}},
 'undir_edges': {'e0': {'src': 'v0', 'tgt': 'v59'},
                 'e1': {'src': 'v0', 'tgt': 'v1'},
                 'e10': {'src': 'v5', 'tgt': 'v6'},
                 'e11': {'src': 'v5', 'tgt': 'v20'},
                 'e12': {'src': 'v6', 'tgt': 'v7'},
                 'e13': {'src': 'v6', 'tgt': 'v21'},
                 'e14': {'src': 'v7', 'tgt': 'v8'},
                 'e15': {'src': 'v7', 'tgt': 'v22'},
                 'e16': {'src': 'v8', 'tgt': 'v15'},
                 'e17': {'src': 'v8', 'tgt': 'v23'},
                 'e18': {'src': 'v9', 'tgt': 'v14'},
                 'e19': {'src': 'v9', 'tgt': 'v10'},
                 'e2': {'src': 'v1', 'tgt': 'v2'},
                 'e20': {'src': 'v9', 'tgt': 'v16'},
                 'e21': {'src': 'v10', 'tgt': 'v11'},
                 'e22': {'src': 'v10', 'tgt': 'v27'},
                 'e23': {'src': 'v11', 'tgt': 'v49'},
                 'e24': {'src': 'v11', 'tgt': 'v18'},
                 'e25': {'src': 'v12', 'tgt': 'v59'},
                 'e26': {'src': 'v12', 'tgt': 'v13'},
                 'e27': {'src': 'v13', 'tgt': 'v14'},
                 'e28': {'src': 'v13', 'tgt': 'v23'},
                 'e29': {'src': 'v15', 'tgt': 'v47'},
                 'e3': {'src': 'v1', 'tgt': 'v16'},
                 'e30': {'src': 'v15', 'tgt': 'v25'},
                 'e31': {'src': 'v16', 'tgt': 'v41'},
                 'e32': {'src': 'v17', 'tgt': 'v42'},
                 'e33': {'src': 'v17', 'tgt': 'v27'},
                 'e34': {'src': 'v18', 'tgt': 'v43'},
                 'e35': {'src': 'v19', 'tgt': 'v37'},
                 'e36': {'src': 'v19', 'tgt': 'v29'},
                 'e37': {'src': 'v20', 'tgt': 'v28'},
                 'e38': {'src': 'v20', 'tgt': 'v38'},
                 'e39': {'src': 'v21', 'tgt': 'v31'},
                 'e4': {'src': 'v2', 'tgt': 'v3'},
                 'e40': {'src': 'v21', 'tgt': 'v39'},
                 'e41': {'src': 'v22', 'tgt': 'v44'},
                 'e42': {'src': 'v22', 'tgt': 'v63'},
                 'e43': {'src': 'v24', 'tgt': 'v34'},
                 'e44': {'src': 'v24', 'tgt': 'v45'},
                 'e45': {'src': 'v25', 'tgt': 'v55'},
                 'e46': {'src': 'v25', 'tgt': 'v61'},
                 'e47': {'src': 'v25', 'tgt': 'v52'},
                 'e48': {'src': 'v26', 'tgt': 'v57'},
                 'e49': {'src': 'v26', 'tgt': 'v62'},
                 'e5': {'src': 'v2', 'tgt': 'v17'},
                 'e50': {'src': 'v26', 'tgt': 'v54'},
                 'e51': {'src': 'v26', 'tgt': 'v46'},
                 'e52': {'src': 'v28', 'tgt': 'v30'},
                 'e53': {'src': 'v29', 'tgt': 'v35'},
                 'e54': {'src': 'v29', 'tgt': 'v30'},
                 'e55': {'src': 'v30', 'tgt': 'v31'},
                 'e56': {'src': 'v31', 'tgt': 'v32'},
                 'e57': {'src': 'v32', 'tgt': 'v50'},
                 'e58': {'src': 'v32', 'tgt': 'v63'},
                 'e59': {'src': 'v33', 'tgt': 'v60'},
                 'e6': {'src': 'v3', 'tgt': 'v4'},
                 'e60': {'src': 'v33', 'tgt': 'v34'},
                 'e61': {'src': 'v34', 'tgt': 'v35'},
                 'e62': {'src': 'v37', 'tgt': 'v43'},
                 'e63': {'src': 'v37', 'tgt': 'v38'},
                 'e64': {'src': 'v38', 'tgt': 'v39'},
                 'e65': {'src': 'v39', 'tgt': 'v44'},
                 'e66': {'src': 'v40', 'tgt': 'v60'},
                 'e67': {'src': 'v40', 'tgt': 'v41'},
                 'e68': {'src': 'v41', 'tgt': 'v42'},
                 'e69': {'src': 'v42', 'tgt': 'v43'},
                 'e7': {'src': 'v3', 'tgt': 'v18'},
                 'e70': {'src': 'v44', 'tgt': 'v45'},
                 'e71': {'src': 'v45', 'tgt': 'v46'},
                 'e72': {'src': 'v46', 'tgt': 'v48'},
                 'e73': {'src': 'v47', 'tgt': 'v49'},
                 'e74': {'src': 'v48', 'tgt': 'v50'},
                 'e75': {'src': 'v49', 'tgt': 'v51'},
                 'e76': {'src': 'v50', 'tgt': 'v55'},
                 'e77': {'src': 'v51', 'tgt': 'v52'},
                 'e78': {'src': 'v52', 'tgt': 'v53'},
                 'e79': {'src': 'v53', 'tgt': 'v54'},
                 'e8': {'src': 'v4', 'tgt': 'v5'},
                 'e80': {'src': 'v54', 'tgt': 'b1'},
                 'e81': {'src': 'v55', 'tgt': 'v56'},
                 'e82': {'src': 'v56', 'tgt': 'v57'},
                 'e83': {'src': 'v57', 'tgt': 'v58'},
                 'e84': {'src': 'v58', 'tgt': 'b3'},
                 'e85': {'src': 'v59', 'tgt': 'b0'},
                 'e86': {'src': 'v60', 'tgt': 'b2'},
                 'e9': {'src': 'v4', 'tgt': 'v19'}},
 'wire_vertices': {'b0': {'annotation': {'boundary': True,
                                         'coord': [0.0, -2.0],
                                         'input': 0}},
                   'b1': {'annotation': {'boundary': True,
                                         'coord': [18.0, -2.0],
                                         'output': 0}},
                   'b2': {'annotation': {'boundary': True,
                                         'coord': [0.0, -5.0],
                                         'input': 1}},
                   'b3': {'annotation': {'boundary': True,
                                         'coord': [18.0, -5.0],
                                         'output': 1}}}}


class TestGraphIO(unittest.TestCase):

    def test_load_multigraph_preserve_parallel_edges(self):
        g = Graph('multigraph')
        g.set_auto_simplify(False)
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.X, 0, 1)
        x = g.add_vertex(VertexType.X, 0, 2)
        g.add_edge((v,w))
        g.add_edge((v,w))
        g.add_edge((w,x))
        g.add_edge((w,x),EdgeType.HADAMARD)

        d = g.to_dict()
        g2 = Graph.from_json(d)
        self.assertTrue(g2.backend,'multigraph')
        self.assertFalse(g2.get_auto_simplify())
        self.assertEqual(g.num_edges(), g2.num_edges())

        js = json.dumps(d)
        g3 = Graph.from_json(js)
        self.assertTrue(g3.backend,'multigraph')
        self.assertFalse(g3.get_auto_simplify())
        self.assertEqual(g.num_edges(), g3.num_edges())

    def test_load_json_old_format(self):
        js = json.dumps(test_graph_old_format)
        g = Graph.from_json(js)
        js2 = g.to_json()

    def test_load_tikz(self):
        js = json.dumps(test_graph_old_format)
        g = Graph.from_json(js)
        tikz = g.to_tikz()
        g2 = Graph.from_tikz(tikz, warn_overlap=False)

    def test_dict_to_graph_scalar_roundtrip(self):
        g = Graph()
        v = g.add_vertex(VertexType.Z, 0, 0)
        w = g.add_vertex(VertexType.X, 0, 1)
        x = g.add_vertex(VertexType.Z, 0, 2)
        g.add_edge((v, w))
        g.add_edge((w, x), EdgeType.HADAMARD)

        g.scalar.power2 = 3
        g.scalar.phase = Fraction(1, 4)
        g.scalar.floatfactor = 2.5
        normalized_scalar = Scalar.from_json(g.scalar.to_dict())

        d = graph_to_dict(g)

        g2 = dict_to_graph(d)
        self.assertEqual(g2.scalar, normalized_scalar)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)
        self.assertEqual(g3.scalar, normalized_scalar)

    def test_zbox_label_roundtrip(self):
        g = Graph()
        v1 = g.add_vertex(VertexType.Z_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.Z_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.Z_BOX, 0, 2)

        poly_label = new_var('alpha', is_bool=False, registry=g.var_registry) + Fraction(1, 2)
        g.set_vdata(v1, 'label', Fraction(3, 4))
        g.set_vdata(v2, 'label', poly_label)
        g.set_vdata(v3, 'label', 2.5 + 1.3j)
        g.set_vdata(v1, 'name', 'my vertex')
        g.set_vdata(v2, 'custom', 42)

        d = graph_to_dict(g)
        g2 = dict_to_graph(d)

        self.assertEqual(g2.vdata(v1, 'label'), Fraction(3, 4))
        self.assertEqual(g2.vdata(v2, 'label'), poly_label)
        self.assertEqual(g2.vdata(v3, 'label'), 2.5 + 1.3j)
        self.assertEqual(g2.vdata(v1, 'name'), 'my vertex')
        self.assertEqual(g2.vdata(v2, 'custom'), 42)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)

        self.assertEqual(g3.vdata(v1, 'label'), Fraction(3, 4))
        self.assertEqual(g3.vdata(v2, 'label'), poly_label)
        self.assertEqual(g3.vdata(v3, 'label'), 2.5 + 1.3j)
        self.assertEqual(g3.vdata(v1, 'name'), 'my vertex')
        self.assertEqual(g3.vdata(v2, 'custom'), 42)

    def test_hbox_label_roundtrip(self):
        """Test JSON round-trip for H-box complex labels."""
        g = Graph()
        v1 = g.add_vertex(VertexType.H_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.H_BOX, 0, 2)

        set_h_box_label(g, v1, -1)  # Standard Hadamard
        set_h_box_label(g, v2, 1j)  # Complex label
        set_h_box_label(g, v3, 2.5 + 1.3j)  # Another complex label

        d = graph_to_dict(g)
        g2 = dict_to_graph(d)

        self.assertTrue(hbox_has_complex_label(g2, v1))
        self.assertTrue(hbox_has_complex_label(g2, v2))
        self.assertTrue(hbox_has_complex_label(g2, v3))
        self.assertEqual(get_h_box_label(g2, v1), -1)
        self.assertEqual(get_h_box_label(g2, v2), 1j)
        self.assertEqual(get_h_box_label(g2, v3), 2.5 + 1.3j)

        js = json.dumps(d)
        d2 = json.loads(js)
        g3 = dict_to_graph(d2)

        self.assertTrue(hbox_has_complex_label(g3, v1))
        self.assertTrue(hbox_has_complex_label(g3, v2))
        self.assertTrue(hbox_has_complex_label(g3, v3))
        self.assertEqual(get_h_box_label(g3, v1), -1)
        self.assertEqual(get_h_box_label(g3, v2), 1j)
        self.assertEqual(get_h_box_label(g3, v3), 2.5 + 1.3j)

    def test_hbox_label_tikz_roundtrip(self):
        """Test tikz round-trip for H-box complex labels."""
        g = Graph()
        v1 = g.add_vertex(VertexType.H_BOX, 0, 0)
        v2 = g.add_vertex(VertexType.H_BOX, 0, 1)
        v3 = g.add_vertex(VertexType.H_BOX, 0, 2)

        set_h_box_label(g, v1, -1)  # Standard Hadamard
        set_h_box_label(g, v2, 1j)  # Complex label
        set_h_box_label(g, v3, 2.5+1.3j)  # Another complex label

        tikz = g.to_tikz()
        g2 = Graph.from_tikz(tikz, warn_overlap=False)

        # Find corresponding vertices in g2 by position.
        v1_new = [v for v in g2.vertices() if g2.row(v) == 0][0]
        v2_new = [v for v in g2.vertices() if g2.row(v) == 1][0]
        v3_new = [v for v in g2.vertices() if g2.row(v) == 2][0]

        # Standard Hadamard (-1) exports as empty and imports as legacy phase=1.
        # Check semantic equivalence rather than format preservation.
        self.assertAlmostEqual(get_h_box_label(g2, v1_new), -1, places=10)
        # Non-standard labels should preserve exact format.
        self.assertTrue(hbox_has_complex_label(g2, v2_new))
        self.assertTrue(hbox_has_complex_label(g2, v3_new))
        self.assertEqual(get_h_box_label(g2, v2_new), 1j)
        self.assertEqual(get_h_box_label(g2, v3_new), 2.5+1.3j)

if __name__ == '__main__':
    unittest.main()
