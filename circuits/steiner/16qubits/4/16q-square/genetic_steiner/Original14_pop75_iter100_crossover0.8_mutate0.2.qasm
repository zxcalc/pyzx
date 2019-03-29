// Initial wiring: [7, 15, 8, 1, 11, 3, 10, 5, 0, 6, 13, 2, 9, 14, 12, 4]
// Resulting wiring: [7, 15, 8, 1, 11, 3, 10, 5, 0, 6, 13, 2, 9, 14, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[6];
cx q[9], q[14];
cx q[4], q[5];
