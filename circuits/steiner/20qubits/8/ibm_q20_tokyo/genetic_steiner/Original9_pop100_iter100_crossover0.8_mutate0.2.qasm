// Initial wiring: [2, 10, 13, 17, 19, 3, 8, 15, 16, 9, 0, 5, 11, 4, 7, 1, 6, 14, 12, 18]
// Resulting wiring: [2, 10, 13, 17, 19, 3, 8, 15, 16, 9, 0, 5, 11, 4, 7, 1, 6, 14, 12, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[8], q[2];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[16];
cx q[9], q[11];
cx q[7], q[8];
cx q[2], q[3];
