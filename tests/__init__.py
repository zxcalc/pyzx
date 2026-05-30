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


# Shared test fixtures and helpers.

# Steane X-stabiliser measurement circuit: 3 stabiliser rounds with
# mid-circuit resets after the first two measurements.
STEANE_X_STABILISER_QASM = """
OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
creg c[3];
h q[0];
cx q[0], q[1]; cx q[0], q[2]; cx q[0], q[3]; cx q[0], q[4];
h q[0];
measure q[0] -> c[0];
reset q[0];
h q[0];
cx q[0], q[1]; cx q[0], q[2]; cx q[0], q[5]; cx q[0], q[6];
h q[0];
measure q[0] -> c[1];
reset q[0];
h q[0];
cx q[0], q[1]; cx q[0], q[3]; cx q[0], q[5]; cx q[0], q[7];
h q[0];
measure q[0] -> c[2];
"""


def outcome_leaves(g, kind):
    """Return vertices tagged with ``vdata('outcome_type') == kind``.

    ``kind`` is one of ``'reset_discard'``, ``'reset_state'``, or
    ``'measurement'``.
    """
    return [v for v in g.vertices() if g.vdata(v, 'outcome_type') == kind]


def discard_leaves(g):
    return outcome_leaves(g, 'reset_discard')


def prep_leaves(g):
    return outcome_leaves(g, 'reset_state')


def measurement_leaves(g):
    return outcome_leaves(g, 'measurement')


if __name__ == '__main__':
    import unittest
    import sys
    sys.path.append('..')
    sys.path.append('.')
    loader = unittest.TestLoader()
    start_dir = '.'
    suite = loader.discover(start_dir)

    runner = unittest.TextTestRunner()
    runner.run(suite)