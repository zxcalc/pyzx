// Initial wiring: [13, 14, 0, 17, 16, 18, 7, 6, 10, 9, 4, 15, 8, 1, 12, 11, 3, 5, 2, 19]
// Resulting wiring: [13, 14, 0, 17, 16, 18, 7, 6, 10, 9, 4, 15, 8, 1, 12, 11, 3, 5, 2, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[15], q[13];
cx q[17], q[16];
cx q[14], q[15];
