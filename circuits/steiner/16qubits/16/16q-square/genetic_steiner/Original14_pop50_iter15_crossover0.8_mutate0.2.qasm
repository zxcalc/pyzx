// Initial wiring: [6, 9, 10, 1, 11, 15, 4, 7, 14, 0, 13, 12, 8, 5, 2, 3]
// Resulting wiring: [6, 9, 10, 1, 11, 15, 4, 7, 14, 0, 13, 12, 8, 5, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[5];
cx q[15], q[8];
cx q[13], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[9], q[8];
cx q[4], q[11];
cx q[4], q[5];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[6];
cx q[0], q[1];
