// Initial wiring: [6, 5, 1, 7, 0, 8, 4, 2, 3]
// Resulting wiring: [6, 5, 1, 7, 0, 8, 4, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[3];
cx q[4], q[1];
