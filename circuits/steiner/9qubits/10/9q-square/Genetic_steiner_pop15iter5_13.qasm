// Initial wiring: [6, 2, 1, 8, 7, 0, 3, 4, 5]
// Resulting wiring: [6, 2, 1, 8, 7, 0, 3, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[0], q[5];
cx q[4], q[7];
cx q[7], q[6];
cx q[4], q[1];
cx q[5], q[0];
