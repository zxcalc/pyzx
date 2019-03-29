// Initial wiring: [13, 7, 6, 10, 5, 4, 0, 11, 14, 3, 9, 1, 15, 8, 12, 2]
// Resulting wiring: [13, 7, 6, 10, 5, 4, 0, 11, 14, 3, 9, 1, 15, 8, 12, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[5];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[13], q[14];
cx q[10], q[11];
cx q[6], q[7];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[5];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[5];
