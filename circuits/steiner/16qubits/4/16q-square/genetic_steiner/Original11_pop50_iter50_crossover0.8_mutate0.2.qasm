// Initial wiring: [13, 7, 4, 15, 8, 9, 3, 0, 1, 6, 5, 14, 2, 11, 12, 10]
// Resulting wiring: [13, 7, 4, 15, 8, 9, 3, 0, 1, 6, 5, 14, 2, 11, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[13], q[10];
cx q[15], q[14];
cx q[0], q[1];
