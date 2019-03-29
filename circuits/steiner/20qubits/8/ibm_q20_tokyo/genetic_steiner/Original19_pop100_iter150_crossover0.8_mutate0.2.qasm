// Initial wiring: [6, 10, 2, 5, 1, 4, 19, 7, 15, 18, 8, 11, 0, 12, 16, 3, 17, 14, 9, 13]
// Resulting wiring: [6, 10, 2, 5, 1, 4, 19, 7, 15, 18, 8, 11, 0, 12, 16, 3, 17, 14, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[9], q[8];
cx q[13], q[6];
cx q[17], q[16];
cx q[9], q[11];
cx q[6], q[7];
