// Initial wiring: [3, 6, 14, 15, 12, 1, 5, 8, 4, 2, 11, 7, 9, 10, 13, 0]
// Resulting wiring: [3, 6, 14, 15, 12, 1, 5, 8, 4, 2, 11, 7, 9, 10, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[9], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[8], q[15];
cx q[15], q[14];
cx q[7], q[8];
cx q[8], q[9];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[7];
