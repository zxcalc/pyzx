// Initial wiring: [8, 15, 0, 9, 3, 11, 6, 10, 12, 5, 4, 13, 1, 14, 2, 7]
// Resulting wiring: [8, 15, 0, 9, 3, 11, 6, 10, 12, 5, 4, 13, 1, 14, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[13];
cx q[14], q[15];
cx q[2], q[5];
cx q[1], q[2];
cx q[0], q[7];
