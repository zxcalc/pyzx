// Initial wiring: [2, 15, 0, 4, 9, 5, 12, 16, 10, 18, 8, 7, 1, 13, 11, 19, 17, 6, 14, 3]
// Resulting wiring: [2, 15, 0, 4, 9, 5, 12, 16, 10, 18, 8, 7, 1, 13, 11, 19, 17, 6, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[14], q[5];
cx q[11], q[17];
cx q[4], q[5];
cx q[2], q[7];
cx q[7], q[13];
cx q[13], q[16];
cx q[1], q[7];
