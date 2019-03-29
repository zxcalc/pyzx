// Initial wiring: [15, 11, 12, 14, 4, 8, 7, 13, 9, 0, 1, 6, 3, 10, 5, 2]
// Resulting wiring: [15, 11, 12, 14, 4, 8, 7, 13, 9, 0, 1, 6, 3, 10, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[6], q[5];
cx q[10], q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[1], q[6];
cx q[6], q[5];
