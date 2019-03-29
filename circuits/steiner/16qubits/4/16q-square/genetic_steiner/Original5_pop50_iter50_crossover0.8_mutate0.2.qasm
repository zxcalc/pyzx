// Initial wiring: [2, 14, 15, 0, 1, 8, 11, 3, 12, 4, 6, 9, 7, 5, 13, 10]
// Resulting wiring: [2, 14, 15, 0, 1, 8, 11, 3, 12, 4, 6, 9, 7, 5, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[14], q[15];
cx q[13], q[14];
cx q[7], q[8];
