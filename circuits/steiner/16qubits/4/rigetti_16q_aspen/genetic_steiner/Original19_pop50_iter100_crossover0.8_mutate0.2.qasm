// Initial wiring: [8, 0, 6, 3, 9, 10, 14, 11, 12, 2, 4, 15, 13, 7, 1, 5]
// Resulting wiring: [8, 0, 6, 3, 9, 10, 14, 11, 12, 2, 4, 15, 13, 7, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[9], q[10];
