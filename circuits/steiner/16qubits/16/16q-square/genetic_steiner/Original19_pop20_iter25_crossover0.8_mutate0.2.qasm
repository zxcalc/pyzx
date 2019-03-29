// Initial wiring: [6, 14, 8, 15, 1, 13, 0, 10, 5, 4, 11, 9, 12, 3, 7, 2]
// Resulting wiring: [6, 14, 8, 15, 1, 13, 0, 10, 5, 4, 11, 9, 12, 3, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[12], q[11];
cx q[15], q[14];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[7], q[8];
cx q[2], q[3];
cx q[3], q[4];
cx q[0], q[7];
cx q[7], q[8];
