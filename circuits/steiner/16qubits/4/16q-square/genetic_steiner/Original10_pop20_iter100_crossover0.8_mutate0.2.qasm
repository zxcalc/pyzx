// Initial wiring: [15, 0, 6, 3, 10, 12, 14, 11, 7, 13, 1, 9, 5, 8, 4, 2]
// Resulting wiring: [15, 0, 6, 3, 10, 12, 14, 11, 7, 13, 1, 9, 5, 8, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[13], q[14];
