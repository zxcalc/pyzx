// Initial wiring: [11, 6, 12, 3, 13, 2, 8, 10, 7, 15, 14, 0, 9, 5, 4, 1]
// Resulting wiring: [11, 6, 12, 3, 13, 2, 8, 10, 7, 15, 14, 0, 9, 5, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[8], q[7];
cx q[9], q[6];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[12];
cx q[5], q[2];
cx q[12], q[11];
cx q[2], q[1];
cx q[5], q[2];
cx q[13], q[12];
cx q[5], q[10];
cx q[10], q[11];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
