// Initial wiring: [8, 10, 0, 1, 11, 14, 6, 13, 12, 9, 4, 5, 7, 15, 3, 2]
// Resulting wiring: [8, 10, 0, 1, 11, 14, 6, 13, 12, 9, 4, 5, 7, 15, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[13], q[10];
cx q[14], q[15];
cx q[3], q[4];
