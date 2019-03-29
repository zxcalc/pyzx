// Initial wiring: [13, 11, 7, 10, 17, 16, 6, 0, 5, 2, 3, 14, 15, 8, 9, 12, 1, 19, 4, 18]
// Resulting wiring: [13, 11, 7, 10, 17, 16, 6, 0, 5, 2, 3, 14, 15, 8, 9, 12, 1, 19, 4, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[10], q[9];
cx q[14], q[5];
cx q[15], q[14];
cx q[17], q[16];
cx q[11], q[17];
cx q[7], q[8];
cx q[0], q[1];
