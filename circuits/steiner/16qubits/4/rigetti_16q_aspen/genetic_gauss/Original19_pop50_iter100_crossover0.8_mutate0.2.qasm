// Initial wiring: [15, 3, 5, 10, 2, 7, 4, 1, 11, 8, 14, 6, 9, 0, 13, 12]
// Resulting wiring: [15, 3, 5, 10, 2, 7, 4, 1, 11, 8, 14, 6, 9, 0, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[6];
cx q[8], q[10];
cx q[4], q[6];
cx q[0], q[6];
