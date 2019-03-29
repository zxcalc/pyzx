// Initial wiring: [9, 7, 3, 13, 6, 12, 10, 4, 1, 15, 8, 14, 5, 0, 2, 11]
// Resulting wiring: [9, 7, 3, 13, 6, 12, 10, 4, 1, 15, 8, 14, 5, 0, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[14], q[13];
cx q[12], q[13];
cx q[9], q[10];
cx q[4], q[11];
cx q[2], q[5];
cx q[5], q[4];
cx q[4], q[11];
cx q[11], q[4];
cx q[1], q[6];
