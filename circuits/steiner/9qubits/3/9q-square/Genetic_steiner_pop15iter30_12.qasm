// Initial wiring: [6, 3, 2, 7, 4, 1, 5, 8, 0]
// Resulting wiring: [6, 3, 2, 7, 4, 1, 5, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[4], q[7];
