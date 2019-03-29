// Initial wiring: [7, 0, 14, 1, 11, 2, 8, 12, 4, 9, 13, 10, 3, 6, 15, 5]
// Resulting wiring: [7, 0, 14, 1, 11, 2, 8, 12, 4, 9, 13, 10, 3, 6, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[13];
cx q[4], q[5];
cx q[5], q[6];
