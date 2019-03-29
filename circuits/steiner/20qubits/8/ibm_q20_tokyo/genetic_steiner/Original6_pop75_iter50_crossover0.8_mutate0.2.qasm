// Initial wiring: [12, 9, 0, 13, 19, 15, 14, 3, 4, 8, 10, 5, 18, 1, 2, 11, 6, 7, 17, 16]
// Resulting wiring: [12, 9, 0, 13, 19, 15, 14, 3, 4, 8, 10, 5, 18, 1, 2, 11, 6, 7, 17, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[12], q[6];
cx q[17], q[16];
cx q[17], q[18];
cx q[13], q[14];
cx q[7], q[13];
cx q[13], q[16];
cx q[3], q[5];
