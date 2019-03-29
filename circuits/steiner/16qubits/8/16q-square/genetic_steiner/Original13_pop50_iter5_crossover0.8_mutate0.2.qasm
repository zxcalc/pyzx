// Initial wiring: [1, 14, 0, 2, 10, 6, 5, 3, 15, 13, 12, 9, 11, 8, 4, 7]
// Resulting wiring: [1, 14, 0, 2, 10, 6, 5, 3, 15, 13, 12, 9, 11, 8, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[12], q[13];
cx q[10], q[11];
cx q[11], q[12];
cx q[9], q[14];
cx q[5], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[10], q[9];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[5];
