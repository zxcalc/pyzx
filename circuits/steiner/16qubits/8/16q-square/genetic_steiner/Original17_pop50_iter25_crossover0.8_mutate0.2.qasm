// Initial wiring: [13, 0, 7, 6, 1, 9, 11, 14, 2, 10, 12, 4, 15, 8, 3, 5]
// Resulting wiring: [13, 0, 7, 6, 1, 9, 11, 14, 2, 10, 12, 4, 15, 8, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[3], q[4];
cx q[4], q[5];
cx q[1], q[6];
cx q[6], q[7];
