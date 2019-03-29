// Initial wiring: [1, 10, 6, 4, 15, 13, 3, 14, 11, 8, 5, 12, 2, 0, 7, 9]
// Resulting wiring: [1, 10, 6, 4, 15, 13, 3, 14, 11, 8, 5, 12, 2, 0, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[8];
cx q[14], q[15];
cx q[2], q[3];
