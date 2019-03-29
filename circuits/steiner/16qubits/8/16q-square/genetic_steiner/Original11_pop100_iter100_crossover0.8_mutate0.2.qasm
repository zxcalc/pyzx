// Initial wiring: [13, 15, 14, 10, 2, 9, 6, 7, 8, 3, 5, 0, 11, 1, 12, 4]
// Resulting wiring: [13, 15, 14, 10, 2, 9, 6, 7, 8, 3, 5, 0, 11, 1, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[13], q[12];
cx q[12], q[11];
cx q[10], q[11];
cx q[8], q[9];
cx q[4], q[5];
cx q[2], q[5];
