// Initial wiring: [8, 2, 15, 7, 5, 12, 14, 9, 13, 4, 0, 3, 10, 1, 11, 6]
// Resulting wiring: [8, 2, 15, 7, 5, 12, 14, 9, 13, 4, 0, 3, 10, 1, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[8], q[7];
cx q[9], q[6];
cx q[12], q[11];
cx q[9], q[10];
cx q[4], q[11];
cx q[4], q[5];
