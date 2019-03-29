// Initial wiring: [10, 15, 2, 11, 1, 14, 9, 6, 8, 0, 3, 13, 12, 5, 4, 7]
// Resulting wiring: [10, 15, 2, 11, 1, 14, 9, 6, 8, 0, 3, 13, 12, 5, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[8], q[6];
cx q[11], q[0];
cx q[12], q[4];
cx q[14], q[12];
cx q[14], q[9];
cx q[15], q[14];
cx q[4], q[1];
cx q[9], q[2];
cx q[14], q[7];
cx q[14], q[10];
cx q[5], q[13];
cx q[5], q[11];
cx q[3], q[13];
cx q[2], q[4];
cx q[1], q[11];
