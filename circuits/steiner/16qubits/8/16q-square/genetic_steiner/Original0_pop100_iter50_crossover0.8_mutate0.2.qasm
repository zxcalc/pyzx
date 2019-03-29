// Initial wiring: [9, 15, 12, 3, 6, 14, 8, 10, 7, 1, 5, 0, 2, 13, 11, 4]
// Resulting wiring: [9, 15, 12, 3, 6, 14, 8, 10, 7, 1, 5, 0, 2, 13, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[10], q[11];
cx q[2], q[5];
cx q[1], q[6];
