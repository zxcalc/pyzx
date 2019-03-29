// Initial wiring: [7, 2, 19, 16, 14, 1, 12, 10, 3, 9, 11, 8, 18, 13, 17, 0, 15, 6, 4, 5]
// Resulting wiring: [7, 2, 19, 16, 14, 1, 12, 10, 3, 9, 11, 8, 18, 13, 17, 0, 15, 6, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[12], q[7];
cx q[13], q[7];
cx q[3], q[4];
