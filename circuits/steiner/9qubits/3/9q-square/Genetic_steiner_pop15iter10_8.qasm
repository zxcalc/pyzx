// Initial wiring: [4, 6, 1, 3, 5, 2, 7, 8, 0]
// Resulting wiring: [4, 6, 1, 3, 5, 2, 7, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[1];
cx q[1], q[4];
cx q[0], q[5];
