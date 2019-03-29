// Initial wiring: [6, 15, 8, 11, 2, 4, 10, 16, 5, 18, 14, 0, 7, 19, 13, 3, 9, 17, 12, 1]
// Resulting wiring: [6, 15, 8, 11, 2, 4, 10, 16, 5, 18, 14, 0, 7, 19, 13, 3, 9, 17, 12, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[13], q[12];
cx q[17], q[16];
cx q[16], q[14];
cx q[15], q[16];
cx q[13], q[14];
cx q[10], q[19];
cx q[5], q[14];
