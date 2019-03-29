// Initial wiring: [2, 15, 14, 12, 8, 3, 6, 11, 7, 5, 9, 1, 4, 0, 13, 10]
// Resulting wiring: [2, 15, 14, 12, 8, 3, 6, 11, 7, 5, 9, 1, 4, 0, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[8];
cx q[8], q[15];
cx q[6], q[7];
cx q[0], q[15];
