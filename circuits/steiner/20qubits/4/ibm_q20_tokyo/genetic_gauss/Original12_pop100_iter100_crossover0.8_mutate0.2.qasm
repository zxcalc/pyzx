// Initial wiring: [8, 3, 18, 6, 12, 16, 9, 11, 10, 5, 19, 15, 0, 17, 2, 14, 13, 7, 4, 1]
// Resulting wiring: [8, 3, 18, 6, 12, 16, 9, 11, 10, 5, 19, 15, 0, 17, 2, 14, 13, 7, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[17], q[3];
cx q[19], q[9];
cx q[2], q[6];
