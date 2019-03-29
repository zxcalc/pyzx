// Initial wiring: [9, 5, 1, 7, 12, 2, 15, 11, 6, 19, 16, 18, 3, 14, 4, 10, 17, 8, 13, 0]
// Resulting wiring: [9, 5, 1, 7, 12, 2, 15, 11, 6, 19, 16, 18, 3, 14, 4, 10, 17, 8, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[12];
cx q[17], q[18];
cx q[11], q[18];
cx q[2], q[8];
