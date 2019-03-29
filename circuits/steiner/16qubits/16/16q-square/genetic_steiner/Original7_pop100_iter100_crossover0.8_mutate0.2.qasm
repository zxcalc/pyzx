// Initial wiring: [10, 15, 9, 11, 8, 7, 13, 1, 6, 5, 3, 2, 14, 0, 4, 12]
// Resulting wiring: [10, 15, 9, 11, 8, 7, 13, 1, 6, 5, 3, 2, 14, 0, 4, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[7], q[6];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[8];
cx q[14], q[15];
cx q[6], q[9];
cx q[5], q[10];
cx q[4], q[5];
cx q[2], q[3];
cx q[3], q[4];
cx q[1], q[6];
cx q[0], q[1];
cx q[1], q[6];
cx q[6], q[9];
cx q[0], q[7];
