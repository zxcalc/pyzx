// Initial wiring: [4, 6, 7, 0, 8, 2, 3, 5, 1]
// Resulting wiring: [4, 6, 7, 0, 8, 2, 3, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[2], q[1];
