// Initial wiring: [11, 9, 16, 4, 5, 6, 1, 18, 19, 14, 12, 17, 10, 0, 7, 13, 8, 3, 2, 15]
// Resulting wiring: [11, 9, 16, 4, 5, 6, 1, 18, 19, 14, 12, 17, 10, 0, 7, 13, 8, 3, 2, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[7], q[1];
cx q[14], q[5];
cx q[0], q[1];
