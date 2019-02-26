// Initial wiring: [6, 7, 3, 8, 5, 2, 4, 0, 1]
// Resulting wiring: [6, 7, 3, 8, 5, 2, 4, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[4];
cx q[0], q[1];
