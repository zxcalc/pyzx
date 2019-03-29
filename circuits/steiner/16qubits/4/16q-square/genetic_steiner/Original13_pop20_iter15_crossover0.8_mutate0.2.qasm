// Initial wiring: [9, 2, 3, 12, 14, 15, 4, 13, 0, 11, 8, 5, 6, 7, 10, 1]
// Resulting wiring: [9, 2, 3, 12, 14, 15, 4, 13, 0, 11, 8, 5, 6, 7, 10, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[6];
cx q[9], q[6];
cx q[1], q[2];
