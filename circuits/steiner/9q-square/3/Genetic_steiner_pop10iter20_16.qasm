// Initial wiring: [6, 5, 3, 2, 7, 8, 0, 4, 1]
// Resulting wiring: [6, 5, 3, 2, 7, 8, 0, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[4], q[5];
cx q[3], q[8];
