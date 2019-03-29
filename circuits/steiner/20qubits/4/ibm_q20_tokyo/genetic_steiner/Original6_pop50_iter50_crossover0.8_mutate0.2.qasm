// Initial wiring: [2, 10, 0, 3, 7, 18, 14, 1, 9, 19, 4, 11, 6, 8, 12, 16, 13, 5, 15, 17]
// Resulting wiring: [2, 10, 0, 3, 7, 18, 14, 1, 9, 19, 4, 11, 6, 8, 12, 16, 13, 5, 15, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[12], q[11];
cx q[12], q[6];
cx q[12], q[17];
