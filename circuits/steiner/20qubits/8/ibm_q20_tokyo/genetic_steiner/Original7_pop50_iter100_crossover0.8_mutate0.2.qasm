// Initial wiring: [0, 8, 18, 6, 19, 4, 13, 11, 5, 17, 15, 14, 2, 10, 12, 1, 7, 16, 3, 9]
// Resulting wiring: [0, 8, 18, 6, 19, 4, 13, 11, 5, 17, 15, 14, 2, 10, 12, 1, 7, 16, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[7], q[6];
cx q[13], q[6];
cx q[6], q[3];
cx q[19], q[10];
cx q[8], q[10];
cx q[4], q[6];
