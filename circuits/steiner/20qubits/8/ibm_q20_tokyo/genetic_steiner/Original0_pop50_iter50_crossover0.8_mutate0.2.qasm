// Initial wiring: [10, 18, 12, 6, 11, 19, 14, 16, 3, 17, 9, 4, 15, 2, 0, 13, 1, 8, 5, 7]
// Resulting wiring: [10, 18, 12, 6, 11, 19, 14, 16, 3, 17, 9, 4, 15, 2, 0, 13, 1, 8, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[9], q[0];
cx q[14], q[16];
cx q[3], q[4];
cx q[1], q[8];
cx q[1], q[7];
cx q[8], q[11];
cx q[7], q[6];
