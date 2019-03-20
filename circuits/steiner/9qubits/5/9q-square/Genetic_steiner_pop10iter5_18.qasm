// Initial wiring: [8, 2, 3, 6, 4, 1, 0, 5, 7]
// Resulting wiring: [8, 2, 3, 6, 4, 1, 0, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[0], q[5];
cx q[1], q[0];
cx q[2], q[1];
