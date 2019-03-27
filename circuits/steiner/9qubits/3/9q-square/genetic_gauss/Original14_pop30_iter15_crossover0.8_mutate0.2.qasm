// Initial wiring: [6, 2, 1, 5, 3, 0, 7, 4, 8]
// Resulting wiring: [6, 2, 1, 5, 3, 0, 7, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[3];
cx q[7], q[4];
cx q[0], q[5];
