// Initial wiring: [9, 10, 4, 12, 5, 6, 14, 19, 17, 1, 7, 13, 3, 11, 16, 18, 2, 0, 8, 15]
// Resulting wiring: [9, 10, 4, 12, 5, 6, 14, 19, 17, 1, 7, 13, 3, 11, 16, 18, 2, 0, 8, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[7], q[5];
cx q[15], q[14];
cx q[15], q[12];
cx q[12], q[2];
cx q[14], q[6];
cx q[17], q[9];
cx q[5], q[13];
