// Initial wiring: [12, 10, 1, 18, 3, 14, 0, 9, 16, 13, 7, 4, 2, 19, 6, 8, 17, 5, 11, 15]
// Resulting wiring: [12, 10, 1, 18, 3, 14, 0, 9, 16, 13, 7, 4, 2, 19, 6, 8, 17, 5, 11, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[15], q[14];
cx q[14], q[5];
cx q[17], q[16];
cx q[7], q[8];
cx q[2], q[3];
