// Initial wiring: [4, 19, 14, 5, 17, 0, 8, 10, 16, 9, 2, 15, 7, 3, 1, 11, 13, 12, 18, 6]
// Resulting wiring: [4, 19, 14, 5, 17, 0, 8, 10, 16, 9, 2, 15, 7, 3, 1, 11, 13, 12, 18, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[8], q[1];
cx q[12], q[6];
cx q[17], q[11];
