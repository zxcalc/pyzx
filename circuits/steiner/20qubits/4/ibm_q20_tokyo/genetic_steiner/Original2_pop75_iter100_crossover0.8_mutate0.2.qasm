// Initial wiring: [8, 18, 13, 9, 3, 17, 2, 4, 14, 12, 0, 7, 10, 15, 16, 5, 11, 1, 19, 6]
// Resulting wiring: [8, 18, 13, 9, 3, 17, 2, 4, 14, 12, 0, 7, 10, 15, 16, 5, 11, 1, 19, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[15];
cx q[12], q[13];
cx q[1], q[8];
cx q[1], q[7];
