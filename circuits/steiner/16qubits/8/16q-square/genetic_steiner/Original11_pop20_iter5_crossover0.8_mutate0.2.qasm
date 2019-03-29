// Initial wiring: [10, 6, 2, 9, 15, 14, 4, 3, 8, 12, 0, 13, 7, 1, 11, 5]
// Resulting wiring: [10, 6, 2, 9, 15, 14, 4, 3, 8, 12, 0, 13, 7, 1, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[2];
cx q[5], q[4];
cx q[8], q[7];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[14];
cx q[13], q[14];
cx q[2], q[3];
cx q[3], q[2];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[2];
