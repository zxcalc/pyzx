// Initial wiring: [9, 4, 15, 0, 5, 14, 8, 7, 13, 6, 10, 11, 2, 3, 12, 1]
// Resulting wiring: [9, 4, 15, 0, 5, 14, 8, 7, 13, 6, 10, 11, 2, 3, 12, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[1];
cx q[7], q[6];
cx q[11], q[7];
cx q[7], q[1];
cx q[9], q[2];
cx q[12], q[5];
cx q[15], q[12];
cx q[5], q[0];
cx q[14], q[1];
cx q[15], q[4];
cx q[13], q[11];
cx q[10], q[12];
cx q[8], q[10];
cx q[4], q[9];
cx q[2], q[5];
cx q[2], q[4];
