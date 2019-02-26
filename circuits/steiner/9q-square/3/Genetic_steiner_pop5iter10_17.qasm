// Initial wiring: [4, 2, 3, 8, 7, 5, 6, 1, 0]
// Resulting wiring: [4, 2, 3, 8, 7, 5, 6, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[4];
cx q[2], q[1];
