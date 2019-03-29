// Initial wiring: [16, 18, 5, 0, 3, 8, 17, 13, 2, 1, 11, 9, 15, 4, 14, 12, 19, 7, 6, 10]
// Resulting wiring: [16, 18, 5, 0, 3, 8, 17, 13, 2, 1, 11, 9, 15, 4, 14, 12, 19, 7, 6, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[12], q[6];
cx q[12], q[17];
cx q[4], q[5];
