// Initial wiring: [15, 12, 2, 9, 8, 14, 7, 5, 4, 13, 10, 1, 0, 3, 6, 11]
// Resulting wiring: [15, 12, 2, 9, 8, 14, 7, 5, 4, 13, 10, 1, 0, 3, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[14];
cx q[8], q[15];
cx q[5], q[6];
cx q[0], q[1];
cx q[1], q[2];
