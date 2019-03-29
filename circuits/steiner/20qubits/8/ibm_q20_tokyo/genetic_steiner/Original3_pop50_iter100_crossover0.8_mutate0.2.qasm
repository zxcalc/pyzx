// Initial wiring: [18, 15, 12, 2, 3, 7, 8, 9, 14, 6, 19, 1, 4, 16, 10, 17, 5, 0, 11, 13]
// Resulting wiring: [18, 15, 12, 2, 3, 7, 8, 9, 14, 6, 19, 1, 4, 16, 10, 17, 5, 0, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[14], q[5];
cx q[17], q[16];
cx q[19], q[18];
cx q[10], q[11];
cx q[8], q[10];
cx q[7], q[13];
cx q[2], q[7];
