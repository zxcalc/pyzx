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
import sys

if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

from pyzx.tikz import tikz_to_graph


class TestTikzErrorHandling(unittest.TestCase):
    """Tests for error handling options in tikz_to_graph."""

    def test_invalid_phase_raises_error_by_default(self):
        """Invalid phase raises error by default."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {$invalid_phase$};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\end{pgfonlayer}
\end{tikzpicture}'''
        with self.assertRaises(ValueError):
            tikz_to_graph(tikz, warn_overlap=False)

    def test_ignore_invalid_phases_z_spider(self):
        """Invalid phase uses default (0) for Z spider."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {$invalid_phase$};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_invalid_phases=True)
        self.assertEqual(g.num_vertices(), 1)
        v = list(g.vertices())[0]
        self.assertEqual(g.phase(v), 0)

    def test_ignore_invalid_phases_x_spider(self):
        """Invalid phase uses default (0) for X spider."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=x spider] (0) at (0, 0) {$bad_phase$};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_invalid_phases=True)
        self.assertEqual(g.num_vertices(), 1)
        v = list(g.vertices())[0]
        self.assertEqual(g.phase(v), 0)

    def test_ignore_invalid_phases_hadamard(self):
        """Invalid phase uses default (1) for H-box."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=hadamard] (0) at (0, 0) {$xyz$};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_invalid_phases=True)
        self.assertEqual(g.num_vertices(), 1)
        v = list(g.vertices())[0]
        self.assertEqual(g.phase(v), 1)

    def test_ignore_invalid_phases_fraction_error(self):
        """Invalid fraction phase uses default."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {$\frac{abc}{def}\pi$};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_invalid_phases=True)
        self.assertEqual(g.num_vertices(), 1)
        v = list(g.vertices())[0]
        self.assertEqual(g.phase(v), 0)

    def test_ignore_parse_errors_malformed_node(self):
        """Malformed nodes are skipped with ignore_parse_errors."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {};
\node this is not a valid node definition
\node [style=z spider] (2) at (2, 0) {};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\draw (0) to (2);
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_parse_errors=True)
        self.assertEqual(g.num_vertices(), 2)
        self.assertEqual(g.num_edges(), 1)

    def test_ignore_parse_errors_malformed_edge(self):
        """Malformed edges are skipped with ignore_parse_errors."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {};
\node [style=z spider] (1) at (1, 0) {};
\node [style=z spider] (2) at (2, 0) {};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\draw (0) to (1);
\draw this is not a valid edge
\draw (1) to (2);
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_parse_errors=True)
        self.assertEqual(g.num_vertices(), 3)
        self.assertEqual(g.num_edges(), 2)

    def test_ignore_parse_errors_edge_to_missing_node(self):
        """Edges referencing skipped nodes are handled."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {};
\node malformed node (1)
\node [style=z spider] (2) at (2, 0) {};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\draw (0) to (1);
\draw (1) to (2);
\draw (0) to (2);
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False, ignore_parse_errors=True)
        self.assertEqual(g.num_vertices(), 2)
        self.assertEqual(g.num_edges(), 1)

    def test_valid_tikz_still_works_with_ignore_options(self):
        """Valid tikz works correctly with ignore options enabled."""
        tikz = r'''\begin{tikzpicture}
\begin{pgfonlayer}{nodelayer}
\node [style=z spider] (0) at (0, 0) {$\frac{\pi}{4}$};
\node [style=x spider] (1) at (1, 0) {$\frac{3\pi}{2}$};
\node [style=hadamard] (2) at (2, 0) {};
\end{pgfonlayer}
\begin{pgfonlayer}{edgelayer}
\draw (0) to (1);
\draw [style=hadamard edge] (1) to (2);
\end{pgfonlayer}
\end{tikzpicture}'''
        g = tikz_to_graph(tikz, warn_overlap=False,
                         ignore_invalid_phases=True, ignore_parse_errors=True)
        self.assertEqual(g.num_vertices(), 3)
        self.assertEqual(g.num_edges(), 2)


if __name__ == '__main__':
    unittest.main()
