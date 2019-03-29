// Initial wiring: [1, 4, 15, 9, 13, 0, 11, 6, 2, 14, 8, 12, 10, 5, 3, 7]
// Resulting wiring: [1, 4, 15, 9, 13, 0, 11, 6, 2, 14, 8, 12, 10, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[7], q[0];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[10], q[11];
cx q[5], q[6];
cx q[6], q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[2], q[1];
cx q[3], q[2];
