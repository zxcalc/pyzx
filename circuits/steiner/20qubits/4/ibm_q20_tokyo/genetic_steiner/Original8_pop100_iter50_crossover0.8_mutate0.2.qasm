// Initial wiring: [11, 19, 6, 12, 13, 4, 0, 17, 10, 8, 3, 9, 1, 15, 5, 7, 16, 18, 14, 2]
// Resulting wiring: [11, 19, 6, 12, 13, 4, 0, 17, 10, 8, 3, 9, 1, 15, 5, 7, 16, 18, 14, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[10], q[9];
cx q[13], q[7];
cx q[13], q[15];
