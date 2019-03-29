// Initial wiring: [15, 1, 11, 8, 0, 4, 12, 7, 3, 14, 13, 10, 9, 2, 6, 5]
// Resulting wiring: [15, 1, 11, 8, 0, 4, 12, 7, 3, 14, 13, 10, 9, 2, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[13], q[10];
cx q[14], q[15];
