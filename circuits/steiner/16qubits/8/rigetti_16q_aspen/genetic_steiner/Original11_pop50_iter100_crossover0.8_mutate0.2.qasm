// Initial wiring: [8, 1, 11, 0, 5, 4, 10, 15, 7, 13, 14, 9, 2, 6, 12, 3]
// Resulting wiring: [8, 1, 11, 0, 5, 4, 10, 15, 7, 13, 14, 9, 2, 6, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[10], q[11];
cx q[8], q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[0], q[15];
