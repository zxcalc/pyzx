// Initial wiring: [6, 1, 2, 0, 4, 3, 5, 7, 8]
// Resulting wiring: [6, 1, 2, 0, 4, 3, 5, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[6], q[5];
cx q[2], q[1];
