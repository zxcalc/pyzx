// Initial wiring: [8, 4, 3, 6, 2, 1, 12, 18, 14, 16, 11, 7, 10, 0, 17, 9, 13, 15, 19, 5]
// Resulting wiring: [8, 4, 3, 6, 2, 1, 12, 18, 14, 16, 11, 7, 10, 0, 17, 9, 13, 15, 19, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[12], q[17];
cx q[10], q[19];
cx q[7], q[8];
