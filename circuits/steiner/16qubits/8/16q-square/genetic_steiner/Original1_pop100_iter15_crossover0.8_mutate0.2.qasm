// Initial wiring: [8, 3, 0, 7, 4, 1, 14, 6, 11, 2, 12, 9, 13, 15, 10, 5]
// Resulting wiring: [8, 3, 0, 7, 4, 1, 14, 6, 11, 2, 12, 9, 13, 15, 10, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[12], q[11];
cx q[10], q[11];
cx q[5], q[10];
cx q[2], q[3];
