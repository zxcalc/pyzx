// Initial wiring: [11, 5, 4, 2, 15, 12, 7, 6, 3, 9, 8, 10, 13, 14, 1, 0]
// Resulting wiring: [11, 5, 4, 2, 15, 12, 7, 6, 3, 9, 8, 10, 13, 14, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[14], q[13];
cx q[1], q[6];
