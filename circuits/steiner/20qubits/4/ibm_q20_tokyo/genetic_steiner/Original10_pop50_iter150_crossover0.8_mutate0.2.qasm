// Initial wiring: [9, 19, 6, 4, 5, 16, 12, 3, 15, 17, 14, 18, 8, 1, 7, 0, 10, 2, 13, 11]
// Resulting wiring: [9, 19, 6, 4, 5, 16, 12, 3, 15, 17, 14, 18, 8, 1, 7, 0, 10, 2, 13, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
cx q[18], q[12];
cx q[2], q[3];
cx q[3], q[4];
