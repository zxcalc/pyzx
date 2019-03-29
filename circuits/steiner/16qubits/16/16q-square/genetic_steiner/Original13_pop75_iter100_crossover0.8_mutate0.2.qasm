// Initial wiring: [12, 14, 9, 15, 7, 4, 8, 2, 11, 1, 3, 13, 6, 5, 0, 10]
// Resulting wiring: [12, 14, 9, 15, 7, 4, 8, 2, 11, 1, 3, 13, 6, 5, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[14], q[15];
cx q[12], q[13];
cx q[7], q[8];
cx q[5], q[6];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[2], q[3];
cx q[0], q[1];
