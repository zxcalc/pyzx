// Initial wiring: [6, 12, 5, 3, 13, 4, 1, 7, 2, 8, 11, 9, 15, 0, 10, 14]
// Resulting wiring: [6, 12, 5, 3, 13, 4, 1, 7, 2, 8, 11, 9, 15, 0, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[7];
cx q[13], q[10];
cx q[12], q[13];
cx q[9], q[14];
cx q[8], q[15];
cx q[4], q[5];
