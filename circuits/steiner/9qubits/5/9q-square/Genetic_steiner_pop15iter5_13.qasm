// Initial wiring: [6, 3, 8, 0, 4, 7, 5, 1, 2]
// Resulting wiring: [6, 3, 8, 0, 4, 7, 5, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[4];
cx q[0], q[1];
cx q[3], q[8];
cx q[5], q[0];
cx q[1], q[0];
cx q[0], q[5];
