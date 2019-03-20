// Initial wiring: [6, 1, 4, 2, 3, 5, 0, 7, 8]
// Resulting wiring: [6, 1, 4, 2, 3, 5, 0, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[0], q[5];
cx q[1], q[0];
