// Initial wiring: [14, 4, 0, 11, 9, 2, 5, 10, 15, 1, 8, 12, 7, 3, 6, 13]
// Resulting wiring: [14, 4, 0, 11, 9, 2, 5, 10, 15, 1, 8, 12, 7, 3, 6, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[8], q[7];
cx q[10], q[5];
cx q[8], q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[1], q[6];
