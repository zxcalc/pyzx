// Initial wiring: [7, 4, 10, 13, 8, 6, 14, 15, 9, 5, 12, 1, 0, 11, 3, 2]
// Resulting wiring: [7, 4, 10, 13, 8, 6, 14, 15, 9, 5, 12, 1, 0, 11, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[0];
cx q[13], q[14];
cx q[5], q[10];
