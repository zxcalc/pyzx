// Initial wiring: [3, 15, 1, 2, 12, 5, 11, 13, 10, 7, 6, 0, 9, 8, 14, 4]
// Resulting wiring: [3, 15, 1, 2, 12, 5, 11, 13, 10, 7, 6, 0, 9, 8, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[10];
cx q[2], q[3];
cx q[0], q[1];
