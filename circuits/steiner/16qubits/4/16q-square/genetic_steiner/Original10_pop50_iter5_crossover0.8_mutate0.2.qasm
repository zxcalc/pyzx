// Initial wiring: [2, 5, 7, 4, 8, 13, 12, 11, 6, 14, 1, 9, 3, 15, 0, 10]
// Resulting wiring: [2, 5, 7, 4, 8, 13, 12, 11, 6, 14, 1, 9, 3, 15, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[11], q[10];
cx q[5], q[10];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[5];
