// Initial wiring: [9, 4, 2, 6, 0, 3, 5, 15, 14, 10, 11, 8, 7, 13, 1, 12]
// Resulting wiring: [9, 4, 2, 6, 0, 3, 5, 15, 14, 10, 11, 8, 7, 13, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[13], q[14];
cx q[10], q[11];
cx q[3], q[4];
