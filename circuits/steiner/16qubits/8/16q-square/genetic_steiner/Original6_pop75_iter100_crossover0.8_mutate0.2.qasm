// Initial wiring: [14, 5, 12, 0, 10, 4, 3, 2, 13, 9, 6, 15, 7, 11, 8, 1]
// Resulting wiring: [14, 5, 12, 0, 10, 4, 3, 2, 13, 9, 6, 15, 7, 11, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[13];
cx q[8], q[9];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[10];
cx q[1], q[2];
cx q[0], q[7];
