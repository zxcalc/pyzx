// Initial wiring: [6, 12, 8, 10, 1, 3, 15, 13, 0, 7, 11, 14, 9, 2, 4, 5]
// Resulting wiring: [6, 12, 8, 10, 1, 3, 15, 13, 0, 7, 11, 14, 9, 2, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[6], q[2];
cx q[10], q[3];
cx q[12], q[11];
cx q[14], q[11];
cx q[14], q[1];
cx q[14], q[5];
cx q[15], q[8];
cx q[4], q[10];
cx q[3], q[4];
cx q[2], q[5];
cx q[2], q[13];
cx q[5], q[9];
cx q[1], q[6];
