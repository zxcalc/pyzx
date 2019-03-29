// Initial wiring: [8, 15, 3, 13, 14, 7, 2, 0, 1, 6, 4, 12, 5, 9, 11, 10]
// Resulting wiring: [8, 15, 3, 13, 14, 7, 2, 0, 1, 6, 4, 12, 5, 9, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[12];
cx q[14], q[5];
cx q[1], q[4];
