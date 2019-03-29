// Initial wiring: [8, 17, 6, 10, 7, 4, 9, 11, 18, 3, 0, 14, 12, 1, 19, 5, 16, 13, 2, 15]
// Resulting wiring: [8, 17, 6, 10, 7, 4, 9, 11, 18, 3, 0, 14, 12, 1, 19, 5, 16, 13, 2, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[1];
cx q[10], q[9];
cx q[16], q[15];
cx q[17], q[18];
