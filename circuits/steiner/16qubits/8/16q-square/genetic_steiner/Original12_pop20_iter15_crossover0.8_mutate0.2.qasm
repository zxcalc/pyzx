// Initial wiring: [4, 14, 1, 10, 3, 5, 13, 9, 0, 11, 12, 2, 8, 6, 15, 7]
// Resulting wiring: [4, 14, 1, 10, 3, 5, 13, 9, 0, 11, 12, 2, 8, 6, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[15], q[14];
cx q[11], q[12];
cx q[6], q[7];
cx q[7], q[8];
cx q[5], q[10];
cx q[3], q[4];
cx q[0], q[7];
cx q[7], q[8];
cx q[0], q[1];
cx q[8], q[7];
