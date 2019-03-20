// Initial wiring: [4, 2, 8, 6, 3, 0, 1, 5, 7]
// Resulting wiring: [4, 2, 8, 6, 3, 0, 1, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[7], q[8];
cx q[4], q[1];
