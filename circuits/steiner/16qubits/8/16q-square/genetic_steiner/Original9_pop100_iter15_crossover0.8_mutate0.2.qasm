// Initial wiring: [13, 9, 2, 8, 10, 7, 15, 3, 1, 5, 14, 6, 12, 0, 11, 4]
// Resulting wiring: [13, 9, 2, 8, 10, 7, 15, 3, 1, 5, 14, 6, 12, 0, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[12], q[11];
cx q[7], q[8];
cx q[8], q[9];
cx q[6], q[7];
cx q[7], q[8];
cx q[4], q[11];
cx q[11], q[10];
cx q[3], q[4];
