// Initial wiring: [0, 5, 14, 4, 7, 6, 2, 13, 15, 1, 3, 10, 11, 12, 8, 9]
// Resulting wiring: [0, 5, 14, 4, 7, 6, 2, 13, 15, 1, 3, 10, 11, 12, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[2];
cx q[13], q[10];
cx q[14], q[9];
cx q[10], q[13];
cx q[9], q[14];
cx q[8], q[9];
cx q[9], q[14];
cx q[14], q[9];
cx q[4], q[11];
cx q[1], q[2];
cx q[2], q[5];
