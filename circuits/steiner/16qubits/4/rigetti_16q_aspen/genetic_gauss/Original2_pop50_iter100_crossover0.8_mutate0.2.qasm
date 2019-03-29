// Initial wiring: [8, 3, 10, 11, 6, 9, 15, 12, 13, 7, 0, 2, 14, 4, 5, 1]
// Resulting wiring: [8, 3, 10, 11, 6, 9, 15, 12, 13, 7, 0, 2, 14, 4, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[4];
cx q[9], q[5];
cx q[0], q[3];
cx q[4], q[13];
