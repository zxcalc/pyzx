// Initial wiring: [3, 5, 2, 13, 15, 7, 1, 0, 10, 8, 4, 12, 11, 14, 6, 9]
// Resulting wiring: [3, 5, 2, 13, 15, 7, 1, 0, 10, 8, 4, 12, 11, 14, 6, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[4];
cx q[11], q[10];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[11], q[12];
cx q[6], q[9];
