// Initial wiring: [9, 16, 1, 0, 11, 12, 13, 15, 14, 5, 2, 6, 4, 3, 8, 10, 18, 19, 17, 7]
// Resulting wiring: [9, 16, 1, 0, 11, 12, 13, 15, 14, 5, 2, 6, 4, 3, 8, 10, 18, 19, 17, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[14];
cx q[12], q[4];
cx q[14], q[5];
cx q[18], q[14];
