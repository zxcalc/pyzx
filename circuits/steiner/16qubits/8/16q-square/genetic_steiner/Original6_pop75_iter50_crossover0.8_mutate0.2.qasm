// Initial wiring: [1, 9, 13, 7, 14, 2, 0, 8, 4, 10, 15, 12, 5, 6, 11, 3]
// Resulting wiring: [1, 9, 13, 7, 14, 2, 0, 8, 4, 10, 15, 12, 5, 6, 11, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[12], q[11];
cx q[13], q[14];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[13];
cx q[4], q[5];
cx q[2], q[5];
