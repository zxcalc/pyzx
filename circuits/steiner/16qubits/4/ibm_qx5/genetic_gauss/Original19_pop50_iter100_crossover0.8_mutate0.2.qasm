// Initial wiring: [9, 14, 11, 1, 12, 15, 10, 2, 7, 5, 3, 6, 8, 0, 13, 4]
// Resulting wiring: [9, 14, 11, 1, 12, 15, 10, 2, 7, 5, 3, 6, 8, 0, 13, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[14], q[15];
cx q[7], q[15];
cx q[5], q[15];
