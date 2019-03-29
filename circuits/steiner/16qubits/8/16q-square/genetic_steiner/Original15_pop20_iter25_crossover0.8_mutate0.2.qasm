// Initial wiring: [5, 7, 2, 14, 15, 0, 11, 13, 4, 3, 10, 8, 9, 12, 6, 1]
// Resulting wiring: [5, 7, 2, 14, 15, 0, 11, 13, 4, 3, 10, 8, 9, 12, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[11], q[10];
cx q[15], q[8];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[2], q[3];
