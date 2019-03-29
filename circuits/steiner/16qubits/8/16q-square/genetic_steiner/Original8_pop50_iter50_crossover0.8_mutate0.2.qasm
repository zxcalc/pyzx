// Initial wiring: [1, 4, 9, 5, 13, 8, 12, 7, 15, 0, 3, 6, 2, 10, 14, 11]
// Resulting wiring: [1, 4, 9, 5, 13, 8, 12, 7, 15, 0, 3, 6, 2, 10, 14, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[11], q[10];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[13], q[12];
cx q[7], q[8];
cx q[0], q[7];
cx q[7], q[6];
