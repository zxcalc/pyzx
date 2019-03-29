// Initial wiring: [13, 15, 14, 16, 3, 4, 18, 2, 6, 11, 5, 19, 8, 1, 9, 0, 17, 10, 12, 7]
// Resulting wiring: [13, 15, 14, 16, 3, 4, 18, 2, 6, 11, 5, 19, 8, 1, 9, 0, 17, 10, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[6], q[4];
cx q[3], q[2];
cx q[11], q[8];
cx q[15], q[13];
cx q[16], q[17];
cx q[8], q[9];
cx q[4], q[5];
