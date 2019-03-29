// Initial wiring: [7, 18, 1, 15, 0, 10, 16, 3, 8, 9, 13, 17, 5, 2, 12, 14, 19, 6, 4, 11]
// Resulting wiring: [7, 18, 1, 15, 0, 10, 16, 3, 8, 9, 13, 17, 5, 2, 12, 14, 19, 6, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[6], q[5];
cx q[6], q[4];
cx q[12], q[13];
