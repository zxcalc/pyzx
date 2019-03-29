// Initial wiring: [2, 7, 10, 13, 3, 8, 5, 1, 14, 11, 15, 4, 9, 12, 6, 0]
// Resulting wiring: [2, 7, 10, 13, 3, 8, 5, 1, 14, 11, 15, 4, 9, 12, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[10];
cx q[2], q[3];
