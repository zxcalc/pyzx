// Initial wiring: [17, 2, 16, 4, 7, 9, 13, 3, 14, 10, 15, 1, 0, 6, 12, 19, 8, 18, 11, 5]
// Resulting wiring: [17, 2, 16, 4, 7, 9, 13, 3, 14, 10, 15, 1, 0, 6, 12, 19, 8, 18, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[10];
cx q[6], q[7];
cx q[1], q[8];
