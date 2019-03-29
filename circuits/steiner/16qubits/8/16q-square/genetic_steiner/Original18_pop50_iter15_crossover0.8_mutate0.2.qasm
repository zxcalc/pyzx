// Initial wiring: [3, 9, 7, 14, 0, 1, 10, 13, 15, 4, 2, 8, 6, 12, 5, 11]
// Resulting wiring: [3, 9, 7, 14, 0, 1, 10, 13, 15, 4, 2, 8, 6, 12, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[8], q[7];
cx q[8], q[15];
cx q[8], q[9];
cx q[6], q[7];
cx q[7], q[8];
cx q[5], q[10];
cx q[4], q[5];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[9];
cx q[8], q[7];
