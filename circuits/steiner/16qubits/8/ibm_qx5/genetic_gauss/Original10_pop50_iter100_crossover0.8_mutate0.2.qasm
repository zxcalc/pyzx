// Initial wiring: [7, 12, 15, 10, 0, 4, 6, 8, 9, 5, 3, 1, 11, 2, 13, 14]
// Resulting wiring: [7, 12, 15, 10, 0, 4, 6, 8, 9, 5, 3, 1, 11, 2, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[2];
cx q[10], q[4];
cx q[12], q[5];
cx q[15], q[5];
cx q[4], q[6];
cx q[0], q[4];
cx q[1], q[13];
