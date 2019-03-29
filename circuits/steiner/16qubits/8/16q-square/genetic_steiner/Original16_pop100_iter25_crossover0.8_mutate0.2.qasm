// Initial wiring: [9, 7, 11, 6, 3, 12, 4, 15, 5, 14, 0, 8, 10, 13, 2, 1]
// Resulting wiring: [9, 7, 11, 6, 3, 12, 4, 15, 5, 14, 0, 8, 10, 13, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[5], q[10];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[2], q[3];
