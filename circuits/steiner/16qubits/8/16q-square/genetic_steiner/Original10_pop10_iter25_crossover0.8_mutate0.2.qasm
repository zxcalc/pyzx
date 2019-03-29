// Initial wiring: [7, 3, 5, 9, 15, 6, 0, 1, 13, 11, 4, 8, 14, 12, 2, 10]
// Resulting wiring: [7, 3, 5, 9, 15, 6, 0, 1, 13, 11, 4, 8, 14, 12, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[14];
cx q[9], q[10];
cx q[2], q[5];
cx q[5], q[4];
cx q[1], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[1];
