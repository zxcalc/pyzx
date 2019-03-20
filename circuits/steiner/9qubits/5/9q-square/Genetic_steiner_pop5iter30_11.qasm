// Initial wiring: [0, 1, 8, 6, 3, 2, 4, 5, 7]
// Resulting wiring: [0, 1, 8, 6, 3, 2, 4, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[4];
cx q[4], q[5];
cx q[1], q[4];
cx q[4], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[3], q[8];
cx q[7], q[6];
cx q[3], q[2];
cx q[8], q[3];
