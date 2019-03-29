// Initial wiring: [9, 1, 8, 15, 2, 0, 12, 3, 6, 10, 14, 7, 13, 4, 11, 5]
// Resulting wiring: [9, 1, 8, 15, 2, 0, 12, 3, 6, 10, 14, 7, 13, 4, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[15], q[14];
cx q[12], q[13];
cx q[9], q[10];
