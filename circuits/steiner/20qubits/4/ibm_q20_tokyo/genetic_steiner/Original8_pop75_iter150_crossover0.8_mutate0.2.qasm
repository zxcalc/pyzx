// Initial wiring: [1, 2, 8, 6, 4, 13, 14, 7, 3, 5, 11, 18, 10, 15, 17, 19, 0, 12, 16, 9]
// Resulting wiring: [1, 2, 8, 6, 4, 13, 14, 7, 3, 5, 11, 18, 10, 15, 17, 19, 0, 12, 16, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[13], q[7];
cx q[14], q[16];
cx q[13], q[14];
