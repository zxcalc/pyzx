// Initial wiring: [7, 3, 13, 14, 15, 8, 0, 11, 10, 1, 4, 2, 12, 6, 9, 5]
// Resulting wiring: [7, 3, 13, 14, 15, 8, 0, 11, 10, 1, 4, 2, 12, 6, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[7], q[0];
cx q[14], q[15];
