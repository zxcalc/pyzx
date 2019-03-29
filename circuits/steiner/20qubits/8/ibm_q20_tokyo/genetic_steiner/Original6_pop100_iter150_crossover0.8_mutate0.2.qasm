// Initial wiring: [0, 2, 6, 8, 13, 15, 11, 1, 7, 17, 19, 14, 16, 3, 12, 4, 5, 18, 10, 9]
// Resulting wiring: [0, 2, 6, 8, 13, 15, 11, 1, 7, 17, 19, 14, 16, 3, 12, 4, 5, 18, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[8], q[2];
cx q[11], q[10];
cx q[13], q[7];
cx q[7], q[2];
cx q[17], q[11];
cx q[8], q[9];
cx q[4], q[5];
