// Initial wiring: [1, 4, 6, 11, 17, 7, 18, 5, 14, 2, 16, 19, 15, 10, 8, 0, 3, 12, 9, 13]
// Resulting wiring: [1, 4, 6, 11, 17, 7, 18, 5, 14, 2, 16, 19, 15, 10, 8, 0, 3, 12, 9, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[2], q[8];
cx q[2], q[7];
cx q[2], q[3];
