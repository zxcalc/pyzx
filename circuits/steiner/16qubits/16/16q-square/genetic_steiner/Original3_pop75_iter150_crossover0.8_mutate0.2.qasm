// Initial wiring: [0, 10, 5, 7, 8, 3, 9, 11, 15, 12, 2, 1, 14, 6, 4, 13]
// Resulting wiring: [0, 10, 5, 7, 8, 3, 9, 11, 15, 12, 2, 1, 14, 6, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[6], q[1];
cx q[7], q[0];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[1];
cx q[11], q[4];
cx q[14], q[9];
cx q[14], q[13];
cx q[9], q[6];
cx q[12], q[13];
cx q[10], q[11];
cx q[9], q[10];
cx q[7], q[8];
cx q[4], q[11];
cx q[2], q[5];
cx q[5], q[4];
cx q[4], q[11];
cx q[5], q[6];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[2];
