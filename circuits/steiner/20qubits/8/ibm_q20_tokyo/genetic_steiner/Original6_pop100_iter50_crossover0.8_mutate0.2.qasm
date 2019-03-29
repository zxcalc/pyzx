// Initial wiring: [12, 18, 15, 16, 0, 2, 5, 13, 14, 4, 19, 17, 9, 10, 1, 3, 6, 7, 11, 8]
// Resulting wiring: [12, 18, 15, 16, 0, 2, 5, 13, 14, 4, 19, 17, 9, 10, 1, 3, 6, 7, 11, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[14], q[5];
cx q[15], q[14];
cx q[17], q[16];
cx q[17], q[11];
cx q[14], q[16];
cx q[8], q[10];
cx q[1], q[8];
