// Initial wiring: [12, 11, 1, 7, 4, 0, 13, 14, 10, 9, 15, 6, 8, 3, 2, 5]
// Resulting wiring: [12, 11, 1, 7, 4, 0, 13, 14, 10, 9, 15, 6, 8, 3, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[5];
cx q[10], q[9];
cx q[5], q[2];
cx q[11], q[4];
cx q[9], q[10];
cx q[10], q[13];
cx q[7], q[8];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[4];
cx q[1], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[5];
