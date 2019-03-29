// Initial wiring: [8, 7, 5, 15, 1, 4, 9, 6, 11, 0, 3, 12, 13, 10, 2, 14]
// Resulting wiring: [8, 7, 5, 15, 1, 4, 9, 6, 11, 0, 3, 12, 13, 10, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[5], q[0];
cx q[11], q[8];
cx q[8], q[0];
cx q[8], q[1];
cx q[8], q[3];
cx q[15], q[5];
cx q[15], q[11];
