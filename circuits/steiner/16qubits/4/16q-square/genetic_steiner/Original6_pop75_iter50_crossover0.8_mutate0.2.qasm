// Initial wiring: [9, 15, 7, 3, 0, 5, 13, 8, 12, 4, 11, 1, 14, 10, 2, 6]
// Resulting wiring: [9, 15, 7, 3, 0, 5, 13, 8, 12, 4, 11, 1, 14, 10, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[13];
cx q[13], q[12];
cx q[6], q[9];
cx q[5], q[10];
