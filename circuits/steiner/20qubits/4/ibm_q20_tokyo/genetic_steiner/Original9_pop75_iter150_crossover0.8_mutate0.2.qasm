// Initial wiring: [13, 9, 5, 3, 1, 6, 19, 16, 2, 17, 18, 15, 12, 4, 7, 8, 10, 0, 11, 14]
// Resulting wiring: [13, 9, 5, 3, 1, 6, 19, 16, 2, 17, 18, 15, 12, 4, 7, 8, 10, 0, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[12], q[11];
cx q[16], q[15];
cx q[14], q[15];
