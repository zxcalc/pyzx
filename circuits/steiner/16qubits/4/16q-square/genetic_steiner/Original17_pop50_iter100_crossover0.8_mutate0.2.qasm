// Initial wiring: [9, 15, 0, 3, 14, 13, 6, 11, 2, 10, 5, 8, 12, 7, 4, 1]
// Resulting wiring: [9, 15, 0, 3, 14, 13, 6, 11, 2, 10, 5, 8, 12, 7, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[14], q[15];
cx q[2], q[3];
