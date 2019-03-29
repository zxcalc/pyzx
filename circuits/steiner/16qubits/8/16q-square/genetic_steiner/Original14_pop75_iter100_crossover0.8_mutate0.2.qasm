// Initial wiring: [0, 1, 14, 12, 8, 3, 7, 10, 2, 11, 6, 5, 4, 13, 9, 15]
// Resulting wiring: [0, 1, 14, 12, 8, 3, 7, 10, 2, 11, 6, 5, 4, 13, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[10], q[9];
cx q[10], q[5];
cx q[6], q[7];
