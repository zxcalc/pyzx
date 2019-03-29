// Initial wiring: [4, 11, 14, 5, 10, 1, 12, 2, 13, 9, 15, 7, 8, 0, 6, 3]
// Resulting wiring: [4, 11, 14, 5, 10, 1, 12, 2, 13, 9, 15, 7, 8, 0, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[11], q[4];
cx q[14], q[9];
cx q[11], q[12];
cx q[8], q[15];
cx q[7], q[8];
cx q[8], q[9];
cx q[6], q[9];
cx q[1], q[2];
cx q[2], q[5];
