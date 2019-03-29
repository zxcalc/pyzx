// Initial wiring: [9, 3, 5, 0, 1, 8, 4, 6, 7, 11, 12, 14, 13, 10, 15, 2]
// Resulting wiring: [9, 3, 5, 0, 1, 8, 4, 6, 7, 11, 12, 14, 13, 10, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[14];
cx q[4], q[5];
