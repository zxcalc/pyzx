// Initial wiring: [13, 12, 5, 3, 2, 1, 7, 10, 0, 15, 11, 4, 14, 9, 6, 8]
// Resulting wiring: [13, 12, 5, 3, 2, 1, 7, 10, 0, 15, 11, 4, 14, 9, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[5];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[10], q[9];
cx q[5], q[4];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[8];
cx q[15], q[14];
cx q[14], q[15];
cx q[12], q[13];
cx q[13], q[12];
cx q[6], q[9];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[4], q[11];
cx q[3], q[4];
cx q[4], q[11];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
