// Initial wiring: [7, 15, 2, 1, 11, 13, 14, 4, 3, 12, 0, 8, 10, 6, 9, 5]
// Resulting wiring: [7, 15, 2, 1, 11, 13, 14, 4, 3, 12, 0, 8, 10, 6, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[13], q[10];
cx q[4], q[11];
