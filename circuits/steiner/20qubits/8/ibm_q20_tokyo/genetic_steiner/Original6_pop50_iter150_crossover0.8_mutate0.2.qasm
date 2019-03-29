// Initial wiring: [0, 17, 7, 18, 14, 19, 2, 6, 11, 5, 8, 9, 12, 1, 4, 16, 3, 10, 15, 13]
// Resulting wiring: [0, 17, 7, 18, 14, 19, 2, 6, 11, 5, 8, 9, 12, 1, 4, 16, 3, 10, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[13], q[6];
cx q[16], q[13];
cx q[13], q[7];
cx q[19], q[18];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[7];
