// Initial wiring: [12, 5, 4, 3, 2, 8, 0, 9, 10, 11, 19, 13, 17, 1, 6, 18, 16, 7, 15, 14]
// Resulting wiring: [12, 5, 4, 3, 2, 8, 0, 9, 10, 11, 19, 13, 17, 1, 6, 18, 16, 7, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
cx q[18], q[17];
cx q[18], q[12];
cx q[3], q[5];
