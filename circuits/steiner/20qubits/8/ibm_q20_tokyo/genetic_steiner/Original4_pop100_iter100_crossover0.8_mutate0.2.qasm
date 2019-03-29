// Initial wiring: [16, 14, 3, 19, 15, 2, 8, 12, 1, 10, 6, 0, 5, 18, 7, 11, 17, 4, 13, 9]
// Resulting wiring: [16, 14, 3, 19, 15, 2, 8, 12, 1, 10, 6, 0, 5, 18, 7, 11, 17, 4, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[5], q[4];
cx q[8], q[2];
cx q[13], q[7];
cx q[15], q[14];
cx q[15], q[16];
cx q[11], q[18];
cx q[5], q[6];
