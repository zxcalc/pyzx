// Initial wiring: [5, 15, 12, 0, 3, 4, 6, 8, 11, 13, 2, 10, 14, 1, 7, 9]
// Resulting wiring: [5, 15, 12, 0, 3, 4, 6, 8, 11, 13, 2, 10, 14, 1, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[14], q[15];
cx q[7], q[8];
