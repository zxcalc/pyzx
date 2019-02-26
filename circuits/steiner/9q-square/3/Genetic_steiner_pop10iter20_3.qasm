// Initial wiring: [0, 8, 6, 5, 3, 2, 1, 4, 7]
// Resulting wiring: [0, 8, 6, 5, 3, 2, 1, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[8], q[3];
cx q[4], q[1];
