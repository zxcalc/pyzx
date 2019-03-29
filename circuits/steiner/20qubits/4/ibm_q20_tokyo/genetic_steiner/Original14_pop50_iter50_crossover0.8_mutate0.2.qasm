// Initial wiring: [17, 10, 3, 7, 9, 1, 11, 12, 13, 6, 15, 14, 4, 0, 8, 5, 19, 16, 2, 18]
// Resulting wiring: [17, 10, 3, 7, 9, 1, 11, 12, 13, 6, 15, 14, 4, 0, 8, 5, 19, 16, 2, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[8], q[2];
cx q[11], q[10];
cx q[18], q[11];
