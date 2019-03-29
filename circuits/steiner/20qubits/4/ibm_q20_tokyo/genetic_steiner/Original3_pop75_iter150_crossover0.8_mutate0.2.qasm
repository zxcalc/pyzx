// Initial wiring: [5, 18, 11, 4, 16, 2, 7, 19, 10, 0, 3, 1, 13, 12, 14, 9, 6, 8, 17, 15]
// Resulting wiring: [5, 18, 11, 4, 16, 2, 7, 19, 10, 0, 3, 1, 13, 12, 14, 9, 6, 8, 17, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[16], q[14];
cx q[18], q[19];
cx q[4], q[6];
