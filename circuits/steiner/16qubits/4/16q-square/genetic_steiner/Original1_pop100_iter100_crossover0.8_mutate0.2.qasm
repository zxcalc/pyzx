// Initial wiring: [11, 15, 9, 8, 10, 14, 13, 0, 3, 7, 4, 12, 6, 2, 5, 1]
// Resulting wiring: [11, 15, 9, 8, 10, 14, 13, 0, 3, 7, 4, 12, 6, 2, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[14], q[15];
cx q[9], q[14];
