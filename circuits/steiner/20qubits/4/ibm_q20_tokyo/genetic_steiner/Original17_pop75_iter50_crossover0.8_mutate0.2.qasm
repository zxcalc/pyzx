// Initial wiring: [1, 9, 5, 17, 10, 18, 2, 16, 12, 13, 7, 19, 14, 11, 8, 6, 4, 0, 3, 15]
// Resulting wiring: [1, 9, 5, 17, 10, 18, 2, 16, 12, 13, 7, 19, 14, 11, 8, 6, 4, 0, 3, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[16];
cx q[12], q[17];
cx q[3], q[6];
cx q[1], q[7];
