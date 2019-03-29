// Initial wiring: [3, 9, 15, 19, 2, 1, 5, 4, 6, 0, 18, 13, 17, 14, 16, 11, 12, 8, 10, 7]
// Resulting wiring: [3, 9, 15, 19, 2, 1, 5, 4, 6, 0, 18, 13, 17, 14, 16, 11, 12, 8, 10, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[7], q[6];
cx q[17], q[16];
cx q[11], q[17];
