// Initial wiring: [12, 8, 15, 2, 0, 4, 6, 11, 7, 5, 14, 13, 3, 1, 9, 10]
// Resulting wiring: [12, 8, 15, 2, 0, 4, 6, 11, 7, 5, 14, 13, 3, 1, 9, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[13], q[10];
cx q[2], q[3];
