// Initial wiring: [11, 12, 15, 1, 3, 0, 5, 8, 2, 6, 4, 14, 9, 7, 13, 10]
// Resulting wiring: [11, 12, 15, 1, 3, 0, 5, 8, 2, 6, 4, 14, 9, 7, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[13], q[12];
cx q[14], q[9];
cx q[9], q[10];
