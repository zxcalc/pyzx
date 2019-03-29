// Initial wiring: [12, 14, 9, 3, 4, 15, 7, 10, 0, 5, 6, 13, 8, 2, 11, 1]
// Resulting wiring: [12, 14, 9, 3, 4, 15, 7, 10, 0, 5, 6, 13, 8, 2, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[15], q[14];
cx q[13], q[14];
cx q[4], q[5];
cx q[5], q[6];
cx q[3], q[4];
cx q[3], q[12];
cx q[4], q[5];
cx q[4], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[0], q[1];
