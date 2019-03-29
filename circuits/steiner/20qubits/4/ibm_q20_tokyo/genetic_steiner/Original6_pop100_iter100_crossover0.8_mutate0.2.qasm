// Initial wiring: [2, 10, 4, 18, 7, 0, 9, 17, 8, 12, 19, 3, 14, 6, 11, 5, 1, 15, 16, 13]
// Resulting wiring: [2, 10, 4, 18, 7, 0, 9, 17, 8, 12, 19, 3, 14, 6, 11, 5, 1, 15, 16, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[12];
cx q[13], q[15];
cx q[13], q[14];
cx q[3], q[4];
