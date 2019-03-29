// Initial wiring: [9, 2, 5, 3, 4, 0, 6, 13, 12, 14, 8, 11, 10, 1, 7, 15]
// Resulting wiring: [9, 2, 5, 3, 4, 0, 6, 13, 12, 14, 8, 11, 10, 1, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[2];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[3];
cx q[11], q[4];
cx q[8], q[15];
cx q[6], q[7];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[3], q[4];
cx q[1], q[2];
