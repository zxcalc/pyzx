// Initial wiring: [13, 3, 6, 9, 11, 5, 15, 2, 7, 8, 10, 4, 12, 1, 0, 14]
// Resulting wiring: [13, 3, 6, 9, 11, 5, 15, 2, 7, 8, 10, 4, 12, 1, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[9];
cx q[12], q[4];
cx q[15], q[12];
cx q[13], q[9];
cx q[15], q[11];
cx q[4], q[9];
cx q[4], q[8];
cx q[4], q[6];
