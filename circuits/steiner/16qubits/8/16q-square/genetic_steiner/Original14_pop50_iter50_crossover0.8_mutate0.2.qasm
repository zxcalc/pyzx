// Initial wiring: [13, 15, 4, 9, 10, 7, 3, 14, 12, 8, 11, 2, 1, 6, 5, 0]
// Resulting wiring: [13, 15, 4, 9, 10, 7, 3, 14, 12, 8, 11, 2, 1, 6, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[10], q[9];
cx q[5], q[4];
cx q[11], q[4];
cx q[13], q[10];
cx q[10], q[9];
cx q[6], q[9];
cx q[9], q[8];
