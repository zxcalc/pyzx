// Initial wiring: [9, 2, 14, 12, 13, 4, 3, 16, 1, 8, 0, 6, 11, 18, 17, 5, 10, 19, 7, 15]
// Resulting wiring: [9, 2, 14, 12, 13, 4, 3, 16, 1, 8, 0, 6, 11, 18, 17, 5, 10, 19, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[13], q[7];
cx q[13], q[6];
cx q[7], q[2];
cx q[6], q[5];
cx q[17], q[11];
cx q[14], q[16];
cx q[11], q[12];
