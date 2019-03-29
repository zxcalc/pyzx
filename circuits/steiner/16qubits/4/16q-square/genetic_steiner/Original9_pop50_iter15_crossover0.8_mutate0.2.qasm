// Initial wiring: [7, 12, 0, 15, 4, 14, 9, 6, 13, 2, 8, 1, 10, 3, 11, 5]
// Resulting wiring: [7, 12, 0, 15, 4, 14, 9, 6, 13, 2, 8, 1, 10, 3, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[8], q[7];
cx q[14], q[9];
cx q[9], q[10];
