// Initial wiring: [6, 11, 10, 12, 3, 4, 5, 7, 2, 0, 14, 9, 13, 1, 15, 8]
// Resulting wiring: [6, 11, 10, 12, 3, 4, 5, 7, 2, 0, 14, 9, 13, 1, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[11], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[4], q[3];
cx q[15], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[9], q[10];
cx q[1], q[6];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[6];
cx q[1], q[2];
cx q[2], q[1];
