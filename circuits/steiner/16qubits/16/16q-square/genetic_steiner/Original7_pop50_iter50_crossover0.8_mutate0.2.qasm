// Initial wiring: [10, 15, 1, 0, 3, 13, 5, 6, 11, 7, 8, 2, 14, 12, 4, 9]
// Resulting wiring: [10, 15, 1, 0, 3, 13, 5, 6, 11, 7, 8, 2, 14, 12, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[14], q[13];
cx q[15], q[8];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[6], q[5];
cx q[1], q[6];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[1], q[6];
cx q[2], q[5];
