// Initial wiring: [16, 18, 11, 19, 3, 17, 2, 12, 4, 9, 5, 14, 6, 10, 1, 13, 8, 15, 0, 7]
// Resulting wiring: [16, 18, 11, 19, 3, 17, 2, 12, 4, 9, 5, 14, 6, 10, 1, 13, 8, 15, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[0];
cx q[11], q[18];
cx q[5], q[6];
cx q[2], q[8];
