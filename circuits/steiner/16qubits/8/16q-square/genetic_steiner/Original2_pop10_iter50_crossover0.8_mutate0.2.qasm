// Initial wiring: [4, 10, 1, 8, 5, 0, 12, 11, 2, 14, 7, 13, 3, 6, 15, 9]
// Resulting wiring: [4, 10, 1, 8, 5, 0, 12, 11, 2, 14, 7, 13, 3, 6, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[12], q[13];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[7];
cx q[0], q[7];
