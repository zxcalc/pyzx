// Initial wiring: [10, 5, 7, 1, 9, 15, 13, 2, 0, 12, 4, 11, 6, 14, 8, 3]
// Resulting wiring: [10, 5, 7, 1, 9, 15, 13, 2, 0, 12, 4, 11, 6, 14, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[0];
cx q[6], q[4];
cx q[13], q[7];
cx q[12], q[11];
cx q[6], q[7];
cx q[0], q[5];
cx q[5], q[12];
cx q[1], q[9];
