// Initial wiring: [12, 9, 0, 16, 13, 2, 5, 6, 8, 1, 4, 3, 14, 11, 19, 10, 7, 18, 17, 15]
// Resulting wiring: [12, 9, 0, 16, 13, 2, 5, 6, 8, 1, 4, 3, 14, 11, 19, 10, 7, 18, 17, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[17], q[16];
cx q[7], q[13];
cx q[7], q[12];
