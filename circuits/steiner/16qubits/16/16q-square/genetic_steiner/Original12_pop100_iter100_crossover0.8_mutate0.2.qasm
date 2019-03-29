// Initial wiring: [6, 7, 10, 15, 12, 9, 11, 8, 2, 13, 3, 14, 1, 0, 4, 5]
// Resulting wiring: [6, 7, 10, 15, 12, 9, 11, 8, 2, 13, 3, 14, 1, 0, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[5];
cx q[10], q[9];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[1];
cx q[10], q[9];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[15];
cx q[10], q[11];
cx q[6], q[9];
cx q[5], q[10];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[4];
