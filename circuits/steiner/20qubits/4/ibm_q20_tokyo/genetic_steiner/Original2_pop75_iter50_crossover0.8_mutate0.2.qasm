// Initial wiring: [17, 8, 5, 7, 15, 10, 12, 2, 11, 16, 14, 18, 0, 3, 6, 9, 1, 4, 13, 19]
// Resulting wiring: [17, 8, 5, 7, 15, 10, 12, 2, 11, 16, 14, 18, 0, 3, 6, 9, 1, 4, 13, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[2];
cx q[11], q[10];
cx q[11], q[17];
