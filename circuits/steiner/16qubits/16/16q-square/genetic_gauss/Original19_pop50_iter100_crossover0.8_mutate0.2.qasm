// Initial wiring: [11, 10, 15, 9, 3, 1, 14, 7, 12, 5, 6, 13, 2, 0, 4, 8]
// Resulting wiring: [11, 10, 15, 9, 3, 1, 14, 7, 12, 5, 6, 13, 2, 0, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[8], q[0];
cx q[9], q[0];
cx q[10], q[9];
cx q[9], q[1];
cx q[11], q[5];
cx q[14], q[1];
cx q[15], q[2];
cx q[14], q[4];
cx q[13], q[6];
cx q[12], q[7];
cx q[4], q[8];
cx q[3], q[4];
cx q[2], q[5];
