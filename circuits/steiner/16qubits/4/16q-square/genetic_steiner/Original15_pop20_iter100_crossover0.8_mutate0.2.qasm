// Initial wiring: [11, 13, 2, 0, 7, 8, 4, 12, 14, 15, 3, 9, 5, 6, 1, 10]
// Resulting wiring: [11, 13, 2, 0, 7, 8, 4, 12, 14, 15, 3, 9, 5, 6, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[12];
