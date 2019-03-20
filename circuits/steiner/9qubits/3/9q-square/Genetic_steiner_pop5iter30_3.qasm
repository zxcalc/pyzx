// Initial wiring: [6, 5, 0, 3, 7, 2, 1, 4, 8]
// Resulting wiring: [6, 5, 0, 3, 7, 2, 1, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[3], q[8];
cx q[4], q[1];
