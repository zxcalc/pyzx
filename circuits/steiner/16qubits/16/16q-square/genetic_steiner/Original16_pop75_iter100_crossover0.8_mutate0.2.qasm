// Initial wiring: [6, 9, 2, 5, 3, 15, 0, 1, 4, 13, 11, 14, 10, 12, 8, 7]
// Resulting wiring: [6, 9, 2, 5, 3, 15, 0, 1, 4, 13, 11, 14, 10, 12, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[11], q[12];
cx q[10], q[13];
cx q[9], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[10];
cx q[9], q[8];
cx q[5], q[6];
cx q[6], q[5];
cx q[1], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[0], q[7];
cx q[0], q[1];
cx q[7], q[8];
cx q[1], q[6];
