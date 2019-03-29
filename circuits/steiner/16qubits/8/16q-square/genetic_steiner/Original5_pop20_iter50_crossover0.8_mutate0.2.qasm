// Initial wiring: [8, 11, 13, 9, 5, 10, 6, 14, 1, 2, 0, 3, 15, 12, 7, 4]
// Resulting wiring: [8, 11, 13, 9, 5, 10, 6, 14, 1, 2, 0, 3, 15, 12, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[8], q[7];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[15];
cx q[5], q[10];
cx q[3], q[4];
