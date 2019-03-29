// Initial wiring: [0, 7, 12, 8, 2, 10, 14, 11, 1, 3, 13, 6, 9, 15, 4, 5]
// Resulting wiring: [0, 7, 12, 8, 2, 10, 14, 11, 1, 3, 13, 6, 9, 15, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[8], q[15];
cx q[5], q[6];
cx q[6], q[9];
