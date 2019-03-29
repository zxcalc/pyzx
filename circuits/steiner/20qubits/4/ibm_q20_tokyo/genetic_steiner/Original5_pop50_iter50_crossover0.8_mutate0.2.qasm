// Initial wiring: [0, 5, 17, 14, 18, 13, 1, 15, 8, 7, 10, 12, 4, 2, 3, 16, 9, 11, 19, 6]
// Resulting wiring: [0, 5, 17, 14, 18, 13, 1, 15, 8, 7, 10, 12, 4, 2, 3, 16, 9, 11, 19, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[12], q[17];
cx q[8], q[11];
cx q[2], q[8];
