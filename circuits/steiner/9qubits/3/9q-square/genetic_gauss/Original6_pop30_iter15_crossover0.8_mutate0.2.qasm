// Initial wiring: [6, 8, 2, 7, 1, 5, 4, 0, 3]
// Resulting wiring: [6, 8, 2, 7, 1, 5, 4, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[8], q[0];
cx q[8], q[4];
