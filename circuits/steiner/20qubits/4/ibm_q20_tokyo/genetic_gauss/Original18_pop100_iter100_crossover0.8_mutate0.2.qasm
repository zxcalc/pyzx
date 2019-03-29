// Initial wiring: [5, 12, 4, 13, 14, 17, 19, 11, 8, 1, 3, 15, 10, 9, 6, 0, 2, 16, 7, 18]
// Resulting wiring: [5, 12, 4, 13, 14, 17, 19, 11, 8, 1, 3, 15, 10, 9, 6, 0, 2, 16, 7, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[10], q[2];
cx q[18], q[16];
cx q[11], q[19];
