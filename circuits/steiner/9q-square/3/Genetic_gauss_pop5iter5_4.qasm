// Initial wiring: [0 2 3 8 4 5 6 7 1]
// Resulting wiring: [0 2 3 8 7 5 6 4 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[1];
