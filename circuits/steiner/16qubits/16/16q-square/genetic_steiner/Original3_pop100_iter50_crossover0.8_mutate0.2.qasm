// Initial wiring: [13, 7, 10, 3, 8, 1, 12, 2, 15, 4, 9, 5, 14, 6, 0, 11]
// Resulting wiring: [13, 7, 10, 3, 8, 1, 12, 2, 15, 4, 9, 5, 14, 6, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[8];
cx q[9], q[6];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[4];
cx q[15], q[14];
cx q[15], q[8];
cx q[12], q[13];
cx q[10], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[3], q[4];
cx q[2], q[3];
