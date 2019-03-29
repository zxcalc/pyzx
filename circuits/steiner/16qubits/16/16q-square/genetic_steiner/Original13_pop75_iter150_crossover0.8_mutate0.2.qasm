// Initial wiring: [10, 0, 12, 8, 4, 3, 14, 1, 11, 7, 15, 9, 6, 5, 13, 2]
// Resulting wiring: [10, 0, 12, 8, 4, 3, 14, 1, 11, 7, 15, 9, 6, 5, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[4], q[3];
cx q[6], q[5];
cx q[5], q[4];
cx q[11], q[10];
cx q[11], q[4];
cx q[15], q[8];
cx q[12], q[13];
cx q[10], q[11];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[9];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[5];
