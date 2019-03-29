// Initial wiring: [1, 11, 12, 8, 14, 13, 0, 15, 10, 7, 4, 3, 5, 2, 9, 6]
// Resulting wiring: [1, 11, 12, 8, 14, 13, 0, 15, 10, 7, 4, 3, 5, 2, 9, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[15], q[14];
cx q[12], q[13];
cx q[10], q[13];
cx q[5], q[6];
cx q[6], q[7];
cx q[2], q[5];
cx q[5], q[6];
cx q[1], q[6];
cx q[6], q[7];
cx q[1], q[2];
