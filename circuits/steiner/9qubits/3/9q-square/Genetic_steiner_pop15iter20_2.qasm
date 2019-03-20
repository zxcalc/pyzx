// Initial wiring: [4, 2, 3, 8, 0, 5, 6, 1, 7]
// Resulting wiring: [4, 2, 3, 8, 0, 5, 6, 1, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[6], q[5];
cx q[7], q[6];
