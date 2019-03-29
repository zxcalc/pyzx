// Initial wiring: [12, 9, 0, 11, 5, 3, 2, 10, 6, 8, 1, 15, 7, 4, 13, 14]
// Resulting wiring: [12, 9, 0, 11, 5, 3, 2, 10, 6, 8, 1, 15, 7, 4, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[5];
cx q[7], q[8];
cx q[8], q[7];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[15];
cx q[8], q[7];
