// Initial wiring: [2, 9, 6, 15, 7, 3, 12, 13, 1, 14, 8, 10, 0, 4, 11, 5]
// Resulting wiring: [2, 9, 6, 15, 7, 3, 12, 13, 1, 14, 8, 10, 0, 4, 11, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[11], q[10];
cx q[14], q[9];
cx q[14], q[13];
cx q[9], q[8];
cx q[10], q[11];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[8];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[9], q[8];
cx q[4], q[11];
cx q[11], q[10];
cx q[0], q[7];
cx q[7], q[6];
