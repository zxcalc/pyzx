// Initial wiring: [12, 9, 7, 15, 8, 4, 10, 14, 5, 0, 3, 11, 2, 1, 13, 6]
// Resulting wiring: [12, 9, 7, 15, 8, 4, 10, 14, 5, 0, 3, 11, 2, 1, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[5], q[2];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[15], q[8];
cx q[2], q[5];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[2], q[3];
cx q[3], q[2];
cx q[0], q[7];
