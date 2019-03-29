// Initial wiring: [3, 8, 5, 14, 2, 12, 0, 1, 15, 10, 4, 9, 13, 7, 11, 6]
// Resulting wiring: [3, 8, 5, 14, 2, 12, 0, 1, 15, 10, 4, 9, 13, 7, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[15], q[14];
cx q[6], q[9];
cx q[9], q[8];
cx q[8], q[15];
cx q[3], q[4];
cx q[2], q[5];
