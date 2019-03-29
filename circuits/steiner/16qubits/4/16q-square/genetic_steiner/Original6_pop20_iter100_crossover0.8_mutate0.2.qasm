// Initial wiring: [12, 8, 15, 6, 0, 10, 14, 9, 7, 5, 11, 3, 1, 13, 4, 2]
// Resulting wiring: [12, 8, 15, 6, 0, 10, 14, 9, 7, 5, 11, 3, 1, 13, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[13], q[14];
cx q[9], q[10];
cx q[5], q[6];
