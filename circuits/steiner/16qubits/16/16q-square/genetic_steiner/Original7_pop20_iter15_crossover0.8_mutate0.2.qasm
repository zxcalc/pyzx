// Initial wiring: [0, 15, 1, 10, 5, 13, 3, 9, 11, 7, 4, 6, 14, 12, 2, 8]
// Resulting wiring: [0, 15, 1, 10, 5, 13, 3, 9, 11, 7, 4, 6, 14, 12, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
cx q[10], q[13];
cx q[7], q[8];
cx q[8], q[15];
cx q[4], q[11];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[5];
