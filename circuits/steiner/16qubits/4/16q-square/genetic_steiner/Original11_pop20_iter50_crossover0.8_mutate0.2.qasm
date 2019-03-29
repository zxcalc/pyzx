// Initial wiring: [13, 10, 5, 11, 2, 1, 12, 7, 14, 6, 8, 9, 3, 0, 4, 15]
// Resulting wiring: [13, 10, 5, 11, 2, 1, 12, 7, 14, 6, 8, 9, 3, 0, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[12];
cx q[1], q[6];
cx q[0], q[7];
