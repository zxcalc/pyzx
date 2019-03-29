// Initial wiring: [6, 7, 1, 5, 4, 0, 10, 13, 12, 8, 19, 14, 15, 18, 11, 3, 17, 16, 9, 2]
// Resulting wiring: [6, 7, 1, 5, 4, 0, 10, 13, 12, 8, 19, 14, 15, 18, 11, 3, 17, 16, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[13], q[6];
cx q[17], q[11];
cx q[8], q[11];
