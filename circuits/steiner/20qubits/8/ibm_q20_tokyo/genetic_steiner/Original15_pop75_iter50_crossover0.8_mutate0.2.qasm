// Initial wiring: [15, 3, 8, 14, 19, 9, 18, 13, 16, 17, 1, 6, 2, 4, 10, 5, 0, 11, 7, 12]
// Resulting wiring: [15, 3, 8, 14, 19, 9, 18, 13, 16, 17, 1, 6, 2, 4, 10, 5, 0, 11, 7, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[1];
cx q[12], q[11];
cx q[12], q[6];
cx q[13], q[6];
cx q[17], q[16];
cx q[1], q[7];
cx q[0], q[1];
