// Initial wiring: [19, 7, 2, 10, 12, 0, 11, 14, 18, 8, 9, 3, 4, 6, 13, 15, 5, 16, 17, 1]
// Resulting wiring: [19, 7, 2, 10, 12, 0, 11, 14, 18, 8, 9, 3, 4, 6, 13, 15, 5, 16, 17, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[13], q[7];
cx q[13], q[6];
cx q[13], q[16];
