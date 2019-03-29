// Initial wiring: [2, 10, 6, 1, 5, 11, 8, 13, 14, 9, 12, 3, 15, 7, 4, 0]
// Resulting wiring: [2, 10, 6, 1, 5, 11, 8, 13, 14, 9, 12, 3, 15, 7, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[5];
cx q[12], q[13];
cx q[5], q[10];
cx q[10], q[11];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
