// Initial wiring: [19, 10, 8, 11, 4, 1, 15, 16, 9, 12, 3, 18, 13, 2, 14, 17, 0, 5, 6, 7]
// Resulting wiring: [19, 10, 8, 11, 4, 1, 15, 16, 9, 12, 3, 18, 13, 2, 14, 17, 0, 5, 6, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[15], q[13];
cx q[14], q[16];
cx q[3], q[4];
