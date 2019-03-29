// Initial wiring: [0, 14, 8, 4, 7, 6, 13, 11, 3, 1, 10, 12, 15, 2, 9, 5]
// Resulting wiring: [0, 14, 8, 4, 7, 6, 13, 11, 3, 1, 10, 12, 15, 2, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[10], q[11];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[11];
