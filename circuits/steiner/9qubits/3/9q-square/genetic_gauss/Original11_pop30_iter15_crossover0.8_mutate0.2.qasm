// Initial wiring: [4, 1, 5, 0, 8, 3, 2, 6, 7]
// Resulting wiring: [4, 1, 5, 0, 8, 3, 2, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[7], q[5];
cx q[3], q[5];
