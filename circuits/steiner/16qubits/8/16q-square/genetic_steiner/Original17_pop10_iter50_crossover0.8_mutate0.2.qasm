// Initial wiring: [15, 6, 1, 14, 9, 4, 12, 8, 7, 2, 13, 11, 10, 3, 0, 5]
// Resulting wiring: [15, 6, 1, 14, 9, 4, 12, 8, 7, 2, 13, 11, 10, 3, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[0];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[13];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[3];
