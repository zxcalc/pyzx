// Initial wiring: [14, 16, 18, 0, 17, 9, 7, 8, 19, 10, 5, 4, 15, 2, 12, 11, 1, 3, 13, 6]
// Resulting wiring: [14, 16, 18, 0, 17, 9, 7, 8, 19, 10, 5, 4, 15, 2, 12, 11, 1, 3, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[11], q[8];
cx q[16], q[14];
cx q[12], q[18];
