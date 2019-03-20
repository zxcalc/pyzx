// Initial wiring: [4, 7, 6, 2, 1, 3, 0, 8, 5]
// Resulting wiring: [4, 7, 6, 2, 1, 3, 0, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[7], q[8];
cx q[5], q[4];
