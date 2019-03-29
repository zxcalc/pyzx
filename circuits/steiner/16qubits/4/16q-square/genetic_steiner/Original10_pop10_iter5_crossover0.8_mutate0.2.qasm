// Initial wiring: [10, 4, 3, 2, 11, 8, 5, 14, 0, 12, 1, 15, 9, 13, 6, 7]
// Resulting wiring: [10, 4, 3, 2, 11, 8, 5, 14, 0, 12, 1, 15, 9, 13, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[10], q[13];
cx q[5], q[10];
