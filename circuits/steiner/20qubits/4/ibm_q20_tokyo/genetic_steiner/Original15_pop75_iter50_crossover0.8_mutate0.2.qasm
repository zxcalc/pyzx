// Initial wiring: [2, 8, 0, 1, 15, 19, 5, 14, 16, 4, 6, 3, 12, 13, 10, 7, 18, 17, 11, 9]
// Resulting wiring: [2, 8, 0, 1, 15, 19, 5, 14, 16, 4, 6, 3, 12, 13, 10, 7, 18, 17, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[12], q[7];
cx q[16], q[14];
cx q[13], q[14];
