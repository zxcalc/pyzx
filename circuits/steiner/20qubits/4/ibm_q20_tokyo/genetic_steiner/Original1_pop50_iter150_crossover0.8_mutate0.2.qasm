// Initial wiring: [1, 0, 13, 19, 18, 6, 15, 11, 5, 4, 3, 7, 2, 10, 12, 8, 14, 17, 16, 9]
// Resulting wiring: [1, 0, 13, 19, 18, 6, 15, 11, 5, 4, 3, 7, 2, 10, 12, 8, 14, 17, 16, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[5];
cx q[15], q[16];
cx q[13], q[16];
cx q[12], q[17];
