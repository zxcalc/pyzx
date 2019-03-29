// Initial wiring: [3, 19, 18, 9, 17, 11, 7, 8, 13, 10, 12, 4, 16, 6, 2, 5, 1, 0, 14, 15]
// Resulting wiring: [3, 19, 18, 9, 17, 11, 7, 8, 13, 10, 12, 4, 16, 6, 2, 5, 1, 0, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[16], q[15];
cx q[6], q[13];
cx q[2], q[3];
