// Initial wiring: [1, 3, 7, 10, 0, 11, 2, 6, 5, 13, 9, 8, 15, 14, 12, 4]
// Resulting wiring: [1, 3, 7, 10, 0, 11, 2, 6, 5, 13, 9, 8, 15, 14, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[14];
cx q[14], q[15];
cx q[7], q[8];
cx q[6], q[9];
