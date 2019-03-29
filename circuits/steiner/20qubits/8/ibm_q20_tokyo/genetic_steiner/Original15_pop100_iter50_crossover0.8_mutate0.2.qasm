// Initial wiring: [15, 3, 16, 6, 18, 2, 4, 17, 13, 12, 1, 8, 10, 0, 9, 19, 11, 5, 7, 14]
// Resulting wiring: [15, 3, 16, 6, 18, 2, 4, 17, 13, 12, 1, 8, 10, 0, 9, 19, 11, 5, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[4];
cx q[5], q[3];
cx q[6], q[4];
cx q[16], q[13];
cx q[14], q[15];
cx q[1], q[8];
cx q[0], q[1];
