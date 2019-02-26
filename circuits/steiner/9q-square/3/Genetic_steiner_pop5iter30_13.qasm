// Initial wiring: [6, 7, 8, 4, 2, 1, 5, 0, 3]
// Resulting wiring: [6, 7, 8, 4, 2, 1, 5, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[4], q[5];
cx q[2], q[1];
