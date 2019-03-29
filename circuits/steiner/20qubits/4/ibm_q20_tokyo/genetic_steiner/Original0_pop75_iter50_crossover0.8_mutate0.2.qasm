// Initial wiring: [17, 4, 18, 1, 9, 12, 7, 10, 5, 8, 6, 3, 19, 13, 16, 14, 2, 11, 15, 0]
// Resulting wiring: [17, 4, 18, 1, 9, 12, 7, 10, 5, 8, 6, 3, 19, 13, 16, 14, 2, 11, 15, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[13], q[6];
cx q[19], q[10];
cx q[1], q[8];
