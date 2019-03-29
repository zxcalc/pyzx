// Initial wiring: [13, 7, 0, 3, 5, 6, 11, 8, 9, 4, 15, 1, 2, 12, 14, 10]
// Resulting wiring: [13, 7, 0, 3, 5, 6, 11, 8, 9, 4, 15, 1, 2, 12, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[12];
cx q[14], q[9];
cx q[6], q[9];
cx q[4], q[5];
cx q[5], q[10];
cx q[2], q[5];
cx q[1], q[2];
