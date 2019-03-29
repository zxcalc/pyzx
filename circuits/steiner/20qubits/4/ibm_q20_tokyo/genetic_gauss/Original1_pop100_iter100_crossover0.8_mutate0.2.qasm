// Initial wiring: [1, 7, 15, 10, 11, 6, 4, 16, 2, 8, 3, 14, 13, 12, 9, 19, 18, 17, 0, 5]
// Resulting wiring: [1, 7, 15, 10, 11, 6, 4, 16, 2, 8, 3, 14, 13, 12, 9, 19, 18, 17, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[5];
cx q[9], q[11];
cx q[8], q[17];
cx q[3], q[11];
