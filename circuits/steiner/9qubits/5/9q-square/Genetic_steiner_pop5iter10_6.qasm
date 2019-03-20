// Initial wiring: [8, 5, 3, 2, 0, 1, 4, 6, 7]
// Resulting wiring: [8, 5, 3, 2, 0, 1, 4, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[4];
cx q[0], q[1];
cx q[1], q[4];
cx q[4], q[5];
cx q[7], q[8];
cx q[6], q[5];
