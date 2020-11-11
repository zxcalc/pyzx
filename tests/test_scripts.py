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
import os
if __name__ == '__main__':
    sys.path.append('..')
    sys.path.append('.')

import io

from pyzx.scripts import main


class TestScripts(unittest.TestCase):

    def test_scripts_wrong_command(self):
        sys.stdout = io.StringIO()
        with self.assertRaises(SystemExit):
            main(['fakepath', 'bla', 'bla'])
        sys.stdout = sys.__stdout__

    def test_optimize_quipper_circuit_gives_quipper_circuit(self):
        sys.stdout = io.StringIO()
        main(['fakepath','opt','tests/test_circuit.circuit'])
        assert os.path.isfile('tests/test_circuit.quipper')
        os.remove('tests/test_circuit.quipper')
        sys.stdout = sys.__stdout__

    def test_optimize_quipper_to_qasm(self):
        sys.stdout = io.StringIO()
        main('fakepath opt -t qasm tests/test_circuit.circuit'.split())
        assert os.path.isfile('tests/test_circuit.qasm')
        os.remove('tests/test_circuit.qasm')
        sys.stdout = sys.__stdout__

    def test_optimize_all_options(self):
        sys.stdout = io.StringIO()
        main('fakepath opt -d tests/other_name.bla -t qc -g cliff tests/test_circuit.circuit'.split())
        assert os.path.isfile('tests/other_name.bla')
        os.remove('tests/other_name.bla')
        sys.stdout = sys.__stdout__

    def test_tikz_conversion(self):
        sys.stdout = io.StringIO()
        main('fakepath tikz tests/test_circuit.circuit tests/tikz_circuit.tikz'.split())
        assert os.path.isfile('tests/tikz_circuit.tikz')
        os.remove('tests/tikz_circuit.tikz')
        sys.stdout = sys.__stdout__
    

if __name__ == '__main__':
    print("Please only run this file as a collection of all tests, and with the working directory set to the parent directory.")