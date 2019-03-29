// Initial wiring: [11, 7, 6, 1, 15, 4, 9, 0, 13, 2, 5, 10, 3, 12, 8, 14]
// Resulting wiring: [11, 7, 6, 1, 15, 4, 9, 0, 13, 2, 5, 10, 3, 12, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[5], q[10];
cx q[4], q[11];
cx q[0], q[7];
