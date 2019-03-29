// Initial wiring: [15, 3, 13, 14, 0, 1, 10, 18, 5, 16, 17, 8, 7, 9, 11, 4, 2, 19, 6, 12]
// Resulting wiring: [15, 3, 13, 14, 0, 1, 10, 18, 5, 16, 17, 8, 7, 9, 11, 4, 2, 19, 6, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[2], q[1];
cx q[7], q[2];
cx q[8], q[1];
cx q[12], q[11];
cx q[15], q[13];
cx q[15], q[16];
cx q[5], q[6];
