// Initial wiring: [6, 15, 5, 7, 8, 3, 12, 2, 1, 11, 13, 4, 10, 9, 14, 0]
// Resulting wiring: [6, 15, 5, 7, 8, 3, 12, 2, 1, 11, 13, 4, 10, 9, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[15], q[14];
cx q[15], q[8];
cx q[10], q[11];
cx q[6], q[9];
cx q[5], q[10];
cx q[10], q[11];
cx q[5], q[6];
cx q[11], q[10];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[6];
