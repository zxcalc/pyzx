// Initial wiring: [9, 7, 6, 8, 19, 17, 13, 18, 1, 5, 14, 11, 4, 16, 2, 0, 15, 12, 3, 10]
// Resulting wiring: [9, 7, 6, 8, 19, 17, 13, 18, 1, 5, 14, 11, 4, 16, 2, 0, 15, 12, 3, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[11], q[9];
cx q[15], q[13];
cx q[13], q[6];
cx q[6], q[5];
cx q[16], q[13];
cx q[1], q[2];
cx q[0], q[9];
