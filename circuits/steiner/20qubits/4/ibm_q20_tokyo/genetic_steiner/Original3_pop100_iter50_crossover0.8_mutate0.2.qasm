// Initial wiring: [5, 17, 4, 10, 2, 13, 0, 15, 11, 12, 9, 16, 18, 1, 6, 3, 14, 7, 8, 19]
// Resulting wiring: [5, 17, 4, 10, 2, 13, 0, 15, 11, 12, 9, 16, 18, 1, 6, 3, 14, 7, 8, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[6];
cx q[14], q[16];
cx q[11], q[17];
cx q[1], q[7];
