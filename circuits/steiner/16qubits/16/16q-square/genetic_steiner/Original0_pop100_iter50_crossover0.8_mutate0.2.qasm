// Initial wiring: [9, 3, 13, 5, 0, 2, 12, 6, 11, 14, 10, 1, 15, 7, 8, 4]
// Resulting wiring: [9, 3, 13, 5, 0, 2, 12, 6, 11, 14, 10, 1, 15, 7, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[2];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[7], q[0];
cx q[11], q[10];
cx q[13], q[10];
cx q[13], q[14];
cx q[8], q[9];
cx q[9], q[10];
cx q[8], q[15];
cx q[10], q[11];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[5], q[6];
