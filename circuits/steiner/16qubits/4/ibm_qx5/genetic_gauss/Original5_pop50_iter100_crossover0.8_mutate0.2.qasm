// Initial wiring: [4, 10, 7, 11, 8, 1, 6, 14, 2, 9, 13, 15, 3, 12, 5, 0]
// Resulting wiring: [4, 10, 7, 11, 8, 1, 6, 14, 2, 9, 13, 15, 3, 12, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[1];
cx q[14], q[10];
cx q[12], q[13];
cx q[3], q[4];
