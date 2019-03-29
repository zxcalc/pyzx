// Initial wiring: [1, 0, 14, 2, 4, 3, 13, 10, 6, 5, 15, 11, 7, 8, 12, 9]
// Resulting wiring: [1, 0, 14, 2, 4, 3, 13, 10, 6, 5, 15, 11, 7, 8, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[10], q[11];
cx q[5], q[10];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[2], q[1];
cx q[3], q[2];
