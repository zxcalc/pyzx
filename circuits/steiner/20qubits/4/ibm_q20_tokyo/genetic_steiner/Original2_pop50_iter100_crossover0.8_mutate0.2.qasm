// Initial wiring: [13, 3, 12, 1, 14, 18, 4, 7, 15, 10, 6, 16, 8, 19, 2, 0, 17, 5, 11, 9]
// Resulting wiring: [13, 3, 12, 1, 14, 18, 4, 7, 15, 10, 6, 16, 8, 19, 2, 0, 17, 5, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[9], q[8];
cx q[18], q[17];
cx q[5], q[6];
