// Initial wiring: [1, 6, 12, 8, 14, 9, 11, 13, 10, 4, 0, 3, 15, 7, 5, 2]
// Resulting wiring: [1, 6, 12, 8, 14, 9, 11, 13, 10, 4, 0, 3, 15, 7, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[10], q[6];
cx q[9], q[0];
cx q[6], q[4];
cx q[0], q[5];
cx q[3], q[12];
cx q[3], q[9];
