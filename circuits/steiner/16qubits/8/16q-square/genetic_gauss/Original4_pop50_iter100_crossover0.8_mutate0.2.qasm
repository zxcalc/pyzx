// Initial wiring: [3, 12, 6, 11, 13, 15, 1, 10, 7, 9, 2, 5, 8, 4, 0, 14]
// Resulting wiring: [3, 12, 6, 11, 13, 15, 1, 10, 7, 9, 2, 5, 8, 4, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[12], q[10];
cx q[13], q[11];
cx q[10], q[11];
cx q[9], q[10];
cx q[3], q[14];
cx q[5], q[7];
cx q[5], q[6];
