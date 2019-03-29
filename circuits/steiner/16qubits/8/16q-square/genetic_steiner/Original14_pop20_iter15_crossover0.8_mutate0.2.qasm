// Initial wiring: [0, 9, 2, 10, 7, 14, 1, 12, 3, 8, 6, 11, 4, 13, 5, 15]
// Resulting wiring: [0, 9, 2, 10, 7, 14, 1, 12, 3, 8, 6, 11, 4, 13, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[10], q[11];
cx q[8], q[9];
cx q[2], q[3];
