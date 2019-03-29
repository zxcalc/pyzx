// Initial wiring: [2, 6, 9, 3, 14, 8, 1, 0, 7, 11, 12, 4, 13, 5, 15, 10]
// Resulting wiring: [2, 6, 9, 3, 14, 8, 1, 0, 7, 11, 12, 4, 13, 5, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[5];
cx q[9], q[14];
cx q[4], q[11];
cx q[11], q[10];
