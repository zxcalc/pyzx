// Initial wiring: [13, 9, 1, 15, 4, 2, 5, 8, 3, 14, 0, 12, 11, 7, 6, 10]
// Resulting wiring: [13, 9, 1, 15, 4, 2, 5, 8, 3, 14, 0, 12, 11, 7, 6, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[9], q[6];
cx q[11], q[10];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[14];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[9];
