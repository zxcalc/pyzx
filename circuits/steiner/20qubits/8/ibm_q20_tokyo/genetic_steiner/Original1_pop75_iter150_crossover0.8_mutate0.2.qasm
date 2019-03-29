// Initial wiring: [16, 4, 3, 8, 9, 5, 12, 13, 2, 0, 15, 10, 14, 6, 17, 1, 18, 19, 7, 11]
// Resulting wiring: [16, 4, 3, 8, 9, 5, 12, 13, 2, 0, 15, 10, 14, 6, 17, 1, 18, 19, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[6], q[4];
cx q[7], q[1];
cx q[8], q[1];
cx q[6], q[13];
cx q[6], q[12];
cx q[3], q[5];
cx q[3], q[4];
