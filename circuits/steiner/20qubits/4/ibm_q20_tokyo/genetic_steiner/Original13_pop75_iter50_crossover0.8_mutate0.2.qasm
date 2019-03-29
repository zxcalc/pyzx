// Initial wiring: [16, 11, 17, 2, 15, 7, 6, 1, 5, 10, 3, 12, 18, 13, 8, 19, 9, 0, 4, 14]
// Resulting wiring: [16, 11, 17, 2, 15, 7, 6, 1, 5, 10, 3, 12, 18, 13, 8, 19, 9, 0, 4, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[14], q[13];
cx q[19], q[10];
cx q[12], q[13];
