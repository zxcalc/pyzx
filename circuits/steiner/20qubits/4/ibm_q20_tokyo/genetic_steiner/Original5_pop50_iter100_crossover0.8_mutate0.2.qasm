// Initial wiring: [14, 5, 2, 6, 0, 15, 19, 13, 11, 4, 16, 12, 8, 10, 1, 7, 3, 17, 9, 18]
// Resulting wiring: [14, 5, 2, 6, 0, 15, 19, 13, 11, 4, 16, 12, 8, 10, 1, 7, 3, 17, 9, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[12];
cx q[12], q[11];
cx q[17], q[12];
