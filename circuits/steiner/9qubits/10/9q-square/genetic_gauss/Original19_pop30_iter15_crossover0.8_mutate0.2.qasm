// Initial wiring: [6, 4, 5, 3, 8, 1, 2, 0, 7]
// Resulting wiring: [6, 4, 5, 3, 8, 1, 2, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[3], q[2];
cx q[4], q[0];
cx q[6], q[0];
cx q[8], q[4];
cx q[1], q[7];
cx q[7], q[1];
cx q[0], q[7];
cx q[0], q[4];
cx q[3], q[8];
