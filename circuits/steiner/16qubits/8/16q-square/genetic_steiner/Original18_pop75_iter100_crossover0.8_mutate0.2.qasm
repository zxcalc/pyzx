// Initial wiring: [8, 6, 11, 4, 3, 15, 9, 2, 1, 0, 7, 13, 10, 12, 14, 5]
// Resulting wiring: [8, 6, 11, 4, 3, 15, 9, 2, 1, 0, 7, 13, 10, 12, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[8], q[7];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[12], q[11];
cx q[9], q[14];
cx q[4], q[5];
