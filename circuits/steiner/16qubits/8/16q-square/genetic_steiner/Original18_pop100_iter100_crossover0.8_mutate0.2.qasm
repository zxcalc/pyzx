// Initial wiring: [12, 6, 9, 10, 13, 3, 15, 11, 7, 8, 4, 2, 1, 0, 14, 5]
// Resulting wiring: [12, 6, 9, 10, 13, 3, 15, 11, 7, 8, 4, 2, 1, 0, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[13], q[12];
cx q[13], q[14];
cx q[6], q[7];
cx q[4], q[5];
cx q[5], q[10];
cx q[5], q[6];
cx q[3], q[4];
