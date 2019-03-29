// Initial wiring: [12, 10, 7, 6, 1, 11, 0, 3, 14, 9, 13, 4, 15, 8, 2, 5]
// Resulting wiring: [12, 10, 7, 6, 1, 11, 0, 3, 14, 9, 13, 4, 15, 8, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[4];
cx q[10], q[5];
cx q[5], q[13];
cx q[3], q[6];
