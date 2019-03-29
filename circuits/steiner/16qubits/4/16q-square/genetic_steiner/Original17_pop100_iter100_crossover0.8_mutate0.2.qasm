// Initial wiring: [12, 13, 7, 8, 4, 1, 10, 6, 15, 9, 11, 0, 3, 14, 2, 5]
// Resulting wiring: [12, 13, 7, 8, 4, 1, 10, 6, 15, 9, 11, 0, 3, 14, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[13], q[12];
cx q[11], q[12];
cx q[4], q[5];
