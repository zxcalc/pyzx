// Initial wiring: [4, 16, 5, 1, 15, 17, 7, 2, 9, 12, 19, 18, 11, 6, 0, 14, 10, 8, 3, 13]
// Resulting wiring: [4, 16, 5, 1, 15, 17, 7, 2, 9, 12, 19, 18, 11, 6, 0, 14, 10, 8, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[17];
cx q[5], q[14];
cx q[4], q[6];
cx q[4], q[5];
