// Initial wiring: [13, 8, 15, 12, 14, 1, 4, 2, 5, 6, 9, 11, 0, 7, 10, 3]
// Resulting wiring: [13, 8, 15, 12, 14, 1, 4, 2, 5, 6, 9, 11, 0, 7, 10, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[12], q[11];
cx q[11], q[4];
cx q[5], q[10];
cx q[2], q[3];
cx q[1], q[2];
cx q[1], q[6];
cx q[2], q[3];
