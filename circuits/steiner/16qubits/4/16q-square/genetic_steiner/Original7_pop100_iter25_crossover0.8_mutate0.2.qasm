// Initial wiring: [8, 0, 13, 5, 1, 14, 6, 12, 15, 3, 2, 10, 9, 11, 4, 7]
// Resulting wiring: [8, 0, 13, 5, 1, 14, 6, 12, 15, 3, 2, 10, 9, 11, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[14], q[13];
cx q[13], q[12];
cx q[3], q[4];
