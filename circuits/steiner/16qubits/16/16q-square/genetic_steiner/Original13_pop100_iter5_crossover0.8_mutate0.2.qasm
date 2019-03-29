// Initial wiring: [13, 7, 4, 3, 8, 9, 15, 14, 11, 12, 1, 2, 5, 6, 0, 10]
// Resulting wiring: [13, 7, 4, 3, 8, 9, 15, 14, 11, 12, 1, 2, 5, 6, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[5];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[15];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[5], q[4];
cx q[2], q[3];
cx q[3], q[4];
