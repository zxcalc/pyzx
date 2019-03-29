// Initial wiring: [0, 4, 13, 5, 9, 11, 14, 12, 1, 10, 2, 8, 3, 6, 15, 7]
// Resulting wiring: [0, 4, 13, 5, 9, 11, 14, 12, 1, 10, 2, 8, 3, 6, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[14];
cx q[15], q[8];
cx q[10], q[13];
cx q[13], q[12];
cx q[13], q[10];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[13], q[10];
cx q[8], q[15];
