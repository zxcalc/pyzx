// Initial wiring: [13, 18, 6, 15, 9, 1, 16, 10, 11, 2, 5, 19, 4, 0, 8, 7, 3, 17, 12, 14]
// Resulting wiring: [13, 18, 6, 15, 9, 1, 16, 10, 11, 2, 5, 19, 4, 0, 8, 7, 3, 17, 12, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[6], q[13];
cx q[6], q[7];
cx q[3], q[5];
