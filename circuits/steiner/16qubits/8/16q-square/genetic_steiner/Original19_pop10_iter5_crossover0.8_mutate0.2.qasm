// Initial wiring: [9, 1, 7, 13, 3, 8, 6, 5, 2, 10, 15, 11, 4, 12, 0, 14]
// Resulting wiring: [9, 1, 7, 13, 3, 8, 6, 5, 2, 10, 15, 11, 4, 12, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[11], q[10];
cx q[13], q[12];
cx q[13], q[10];
cx q[12], q[11];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[15], q[14];
cx q[2], q[5];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[2];
