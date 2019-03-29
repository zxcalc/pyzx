// Initial wiring: [12, 8, 11, 3, 13, 1, 4, 15, 0, 5, 6, 2, 7, 14, 9, 10]
// Resulting wiring: [12, 8, 11, 3, 13, 1, 4, 15, 0, 5, 6, 2, 7, 14, 9, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[14], q[9];
cx q[15], q[8];
cx q[5], q[10];
cx q[5], q[6];
