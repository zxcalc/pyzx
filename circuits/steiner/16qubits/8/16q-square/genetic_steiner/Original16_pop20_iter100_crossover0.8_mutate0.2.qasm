// Initial wiring: [3, 5, 14, 4, 2, 0, 12, 11, 7, 8, 1, 13, 10, 9, 15, 6]
// Resulting wiring: [3, 5, 14, 4, 2, 0, 12, 11, 7, 8, 1, 13, 10, 9, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[5], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[8], q[15];
