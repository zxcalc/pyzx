// Initial wiring: [2, 7, 5, 6, 1, 9, 14, 11, 0, 15, 8, 4, 13, 12, 3, 10]
// Resulting wiring: [2, 7, 5, 6, 1, 9, 14, 11, 0, 15, 8, 4, 13, 12, 3, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[6];
cx q[10], q[9];
cx q[11], q[4];
cx q[10], q[13];
cx q[10], q[11];
cx q[3], q[4];
cx q[4], q[5];
