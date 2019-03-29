// Initial wiring: [0, 7, 15, 12, 14, 9, 10, 1, 6, 13, 3, 11, 8, 2, 4, 5]
// Resulting wiring: [0, 7, 15, 12, 14, 9, 10, 1, 6, 13, 3, 11, 8, 2, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[11], q[10];
cx q[14], q[15];
cx q[10], q[13];
cx q[10], q[11];
cx q[5], q[10];
cx q[5], q[6];
cx q[2], q[5];
cx q[0], q[7];
