// Initial wiring: [15, 12, 0, 4, 7, 9, 13, 8, 5, 2, 1, 6, 10, 11, 14, 3]
// Resulting wiring: [15, 12, 0, 4, 7, 9, 13, 8, 5, 2, 1, 6, 10, 11, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[5];
cx q[10], q[9];
cx q[5], q[4];
cx q[9], q[8];
cx q[4], q[3];
cx q[5], q[2];
cx q[14], q[15];
cx q[7], q[8];
cx q[1], q[2];
cx q[2], q[3];
