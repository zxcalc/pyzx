// Initial wiring: [9, 5, 14, 8, 2, 11, 6, 13, 3, 10, 12, 4, 1, 7, 15, 0]
// Resulting wiring: [9, 5, 14, 8, 2, 11, 6, 13, 3, 10, 12, 4, 1, 7, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[7], q[6];
cx q[10], q[13];
