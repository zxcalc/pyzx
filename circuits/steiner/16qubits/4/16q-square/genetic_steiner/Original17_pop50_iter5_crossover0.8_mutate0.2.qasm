// Initial wiring: [7, 1, 4, 13, 9, 11, 8, 10, 2, 12, 3, 14, 15, 0, 5, 6]
// Resulting wiring: [7, 1, 4, 13, 9, 11, 8, 10, 2, 12, 3, 14, 15, 0, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[11], q[10];
cx q[13], q[10];
