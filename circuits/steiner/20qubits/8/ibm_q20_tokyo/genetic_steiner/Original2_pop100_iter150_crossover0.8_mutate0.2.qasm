// Initial wiring: [12, 2, 0, 17, 15, 6, 3, 14, 4, 1, 10, 9, 13, 5, 8, 19, 7, 18, 16, 11]
// Resulting wiring: [12, 2, 0, 17, 15, 6, 3, 14, 4, 1, 10, 9, 13, 5, 8, 19, 7, 18, 16, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[1];
cx q[12], q[6];
cx q[13], q[6];
cx q[16], q[14];
cx q[17], q[12];
cx q[9], q[10];
cx q[8], q[11];
