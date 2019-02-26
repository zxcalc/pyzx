// Initial wiring: [2, 3, 6, 5, 8, 4, 1, 0, 7]
// Resulting wiring: [2, 3, 6, 5, 8, 4, 1, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[1], q[0];
cx q[2], q[1];
