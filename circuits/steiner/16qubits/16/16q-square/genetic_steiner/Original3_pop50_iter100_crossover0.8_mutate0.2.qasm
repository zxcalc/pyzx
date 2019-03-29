// Initial wiring: [0, 4, 6, 14, 13, 5, 10, 11, 15, 12, 9, 2, 1, 8, 3, 7]
// Resulting wiring: [0, 4, 6, 14, 13, 5, 10, 11, 15, 12, 9, 2, 1, 8, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[0];
cx q[9], q[8];
cx q[14], q[13];
cx q[12], q[13];
cx q[13], q[12];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[13];
cx q[11], q[12];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[1], q[2];
cx q[9], q[6];
