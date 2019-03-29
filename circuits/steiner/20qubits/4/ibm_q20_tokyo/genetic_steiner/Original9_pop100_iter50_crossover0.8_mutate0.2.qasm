// Initial wiring: [13, 2, 17, 1, 15, 12, 7, 11, 9, 16, 4, 19, 8, 10, 14, 6, 3, 18, 5, 0]
// Resulting wiring: [13, 2, 17, 1, 15, 12, 7, 11, 9, 16, 4, 19, 8, 10, 14, 6, 3, 18, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[13], q[12];
cx q[9], q[11];
cx q[6], q[12];
