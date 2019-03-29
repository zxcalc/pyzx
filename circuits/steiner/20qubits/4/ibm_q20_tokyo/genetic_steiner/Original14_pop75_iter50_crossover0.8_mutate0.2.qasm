// Initial wiring: [4, 12, 19, 0, 11, 18, 15, 2, 7, 9, 17, 1, 14, 6, 16, 5, 10, 8, 13, 3]
// Resulting wiring: [4, 12, 19, 0, 11, 18, 15, 2, 7, 9, 17, 1, 14, 6, 16, 5, 10, 8, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[12], q[6];
cx q[18], q[19];
cx q[7], q[12];
