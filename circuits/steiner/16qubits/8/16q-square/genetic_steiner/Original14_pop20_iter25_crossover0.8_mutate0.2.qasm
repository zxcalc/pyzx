// Initial wiring: [4, 9, 15, 3, 8, 6, 5, 1, 13, 10, 7, 12, 14, 11, 2, 0]
// Resulting wiring: [4, 9, 15, 3, 8, 6, 5, 1, 13, 10, 7, 12, 14, 11, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[14], q[9];
cx q[10], q[13];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[10];
cx q[3], q[4];
cx q[4], q[11];
