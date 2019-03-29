// Initial wiring: [9, 14, 15, 6, 1, 5, 2, 0, 13, 10, 4, 12, 8, 7, 11, 3]
// Resulting wiring: [9, 14, 15, 6, 1, 5, 2, 0, 13, 10, 4, 12, 8, 7, 11, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[6], q[1];
cx q[1], q[0];
cx q[9], q[6];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[10];
cx q[15], q[14];
cx q[8], q[9];
cx q[5], q[10];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[2], q[5];
