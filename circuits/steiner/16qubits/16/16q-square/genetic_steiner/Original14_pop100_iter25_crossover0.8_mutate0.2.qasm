// Initial wiring: [0, 15, 10, 4, 3, 14, 13, 12, 11, 1, 5, 2, 6, 9, 8, 7]
// Resulting wiring: [0, 15, 10, 4, 3, 14, 13, 12, 11, 1, 5, 2, 6, 9, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[6], q[5];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[0];
cx q[7], q[6];
cx q[12], q[13];
cx q[10], q[11];
cx q[8], q[9];
cx q[4], q[11];
cx q[3], q[4];
cx q[4], q[11];
cx q[4], q[5];
cx q[11], q[4];
