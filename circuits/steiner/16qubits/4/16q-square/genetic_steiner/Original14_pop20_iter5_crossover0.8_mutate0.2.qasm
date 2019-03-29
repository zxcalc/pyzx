// Initial wiring: [9, 1, 14, 4, 5, 10, 2, 15, 7, 3, 12, 13, 6, 11, 8, 0]
// Resulting wiring: [9, 1, 14, 4, 5, 10, 2, 15, 7, 3, 12, 13, 6, 11, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[7], q[8];
