// Initial wiring: [1, 7, 12, 0, 8, 3, 11, 5, 9, 2, 6, 13, 10, 14, 15, 4]
// Resulting wiring: [1, 7, 12, 0, 8, 3, 11, 5, 9, 2, 6, 13, 10, 14, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[10], q[11];
cx q[9], q[10];
cx q[1], q[14];
cx q[0], q[1];
cx q[1], q[2];
