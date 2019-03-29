// Initial wiring: [9, 19, 4, 5, 15, 13, 3, 7, 18, 1, 8, 2, 16, 17, 11, 0, 12, 14, 6, 10]
// Resulting wiring: [9, 19, 4, 5, 15, 13, 3, 7, 18, 1, 8, 2, 16, 17, 11, 0, 12, 14, 6, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[12], q[6];
cx q[6], q[5];
cx q[14], q[15];
cx q[11], q[18];
cx q[4], q[6];
cx q[2], q[8];
cx q[0], q[1];
