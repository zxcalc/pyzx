// Initial wiring: [2, 15, 13, 10, 6, 3, 14, 0, 5, 9, 11, 4, 12, 7, 1, 8]
// Resulting wiring: [2, 15, 13, 10, 6, 3, 14, 0, 5, 9, 11, 4, 12, 7, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[13];
cx q[2], q[5];
cx q[1], q[6];
