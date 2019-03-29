// Initial wiring: [7, 1, 0, 14, 18, 4, 15, 13, 6, 2, 9, 19, 3, 10, 12, 8, 17, 11, 5, 16]
// Resulting wiring: [7, 1, 0, 14, 18, 4, 15, 13, 6, 2, 9, 19, 3, 10, 12, 8, 17, 11, 5, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[13], q[6];
cx q[17], q[18];
cx q[4], q[5];
