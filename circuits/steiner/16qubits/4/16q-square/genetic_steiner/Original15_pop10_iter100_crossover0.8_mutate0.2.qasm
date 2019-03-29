// Initial wiring: [15, 11, 9, 3, 5, 6, 14, 10, 7, 12, 13, 2, 1, 8, 4, 0]
// Resulting wiring: [15, 11, 9, 3, 5, 6, 14, 10, 7, 12, 13, 2, 1, 8, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[10];
cx q[6], q[9];
cx q[9], q[14];
