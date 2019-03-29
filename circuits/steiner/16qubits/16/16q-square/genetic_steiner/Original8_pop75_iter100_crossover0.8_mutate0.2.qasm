// Initial wiring: [2, 1, 4, 5, 7, 3, 6, 8, 0, 13, 15, 11, 9, 10, 14, 12]
// Resulting wiring: [2, 1, 4, 5, 7, 3, 6, 8, 0, 13, 15, 11, 9, 10, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[11], q[4];
cx q[10], q[5];
cx q[4], q[3];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[12];
cx q[5], q[2];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[9], q[10];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[11];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[0], q[7];
