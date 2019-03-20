// Initial wiring: [4, 2, 5, 1, 7, 6, 3, 0, 8]
// Resulting wiring: [4, 2, 5, 1, 7, 6, 3, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[0], q[5];
