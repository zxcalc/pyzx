// Initial wiring: [18, 13, 6, 14, 12, 8, 10, 4, 15, 17, 5, 9, 7, 16, 3, 2, 19, 1, 0, 11]
// Resulting wiring: [18, 13, 6, 14, 12, 8, 10, 4, 15, 17, 5, 9, 7, 16, 3, 2, 19, 1, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[12];
cx q[17], q[18];
cx q[2], q[3];
