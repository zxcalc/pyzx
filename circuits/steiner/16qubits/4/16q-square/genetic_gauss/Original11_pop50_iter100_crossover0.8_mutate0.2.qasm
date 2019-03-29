// Initial wiring: [11, 7, 0, 1, 2, 4, 8, 12, 3, 9, 14, 13, 5, 10, 6, 15]
// Resulting wiring: [11, 7, 0, 1, 2, 4, 8, 12, 3, 9, 14, 13, 5, 10, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[1];
cx q[13], q[7];
cx q[0], q[12];
cx q[2], q[8];
