// Initial wiring: [2, 15, 3, 14, 13, 10, 5, 7, 6, 0, 11, 1, 9, 8, 12, 4]
// Resulting wiring: [2, 15, 3, 14, 13, 10, 5, 7, 6, 0, 11, 1, 9, 8, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[8], q[9];
cx q[4], q[11];
cx q[11], q[10];
cx q[10], q[13];
