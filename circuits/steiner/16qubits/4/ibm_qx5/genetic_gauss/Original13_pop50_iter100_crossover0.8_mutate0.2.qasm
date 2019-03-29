// Initial wiring: [9, 13, 14, 4, 3, 8, 6, 0, 7, 15, 1, 10, 11, 5, 2, 12]
// Resulting wiring: [9, 13, 14, 4, 3, 8, 6, 0, 7, 15, 1, 10, 11, 5, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[3];
cx q[14], q[4];
cx q[1], q[3];
cx q[2], q[15];
