// Initial wiring: [15, 7, 0, 2, 8, 12, 13, 1, 3, 5, 6, 10, 4, 14, 11, 9]
// Resulting wiring: [15, 7, 0, 2, 8, 12, 13, 1, 3, 5, 6, 10, 4, 14, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[11], q[10];
cx q[8], q[9];
cx q[5], q[10];
cx q[10], q[13];
cx q[4], q[11];
cx q[0], q[7];
cx q[7], q[8];
