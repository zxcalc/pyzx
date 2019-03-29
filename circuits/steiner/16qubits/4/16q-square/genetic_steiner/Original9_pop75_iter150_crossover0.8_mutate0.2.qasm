// Initial wiring: [13, 15, 4, 1, 10, 2, 8, 6, 9, 14, 11, 0, 12, 7, 5, 3]
// Resulting wiring: [13, 15, 4, 1, 10, 2, 8, 6, 9, 14, 11, 0, 12, 7, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[12], q[13];
cx q[5], q[6];
cx q[0], q[7];
