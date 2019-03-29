// Initial wiring: [1, 14, 11, 2, 8, 3, 6, 13, 9, 7, 12, 0, 15, 4, 5, 10]
// Resulting wiring: [1, 14, 11, 2, 8, 3, 6, 13, 9, 7, 12, 0, 15, 4, 5, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[9];
cx q[2], q[3];
cx q[3], q[4];
