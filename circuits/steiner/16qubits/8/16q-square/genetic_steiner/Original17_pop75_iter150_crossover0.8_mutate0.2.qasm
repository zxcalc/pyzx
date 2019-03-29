// Initial wiring: [15, 8, 12, 5, 9, 1, 4, 6, 0, 11, 14, 3, 7, 10, 2, 13]
// Resulting wiring: [15, 8, 12, 5, 9, 1, 4, 6, 0, 11, 14, 3, 7, 10, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[9];
cx q[9], q[10];
cx q[1], q[6];
cx q[1], q[2];
