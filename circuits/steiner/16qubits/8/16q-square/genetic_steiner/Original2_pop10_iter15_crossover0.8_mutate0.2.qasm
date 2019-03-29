// Initial wiring: [5, 10, 1, 0, 15, 4, 11, 8, 14, 9, 2, 12, 3, 6, 13, 7]
// Resulting wiring: [5, 10, 1, 0, 15, 4, 11, 8, 14, 9, 2, 12, 3, 6, 13, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[12], q[13];
cx q[9], q[10];
cx q[8], q[15];
cx q[5], q[6];
cx q[4], q[11];
cx q[11], q[10];
