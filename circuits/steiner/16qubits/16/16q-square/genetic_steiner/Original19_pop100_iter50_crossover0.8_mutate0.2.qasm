// Initial wiring: [2, 9, 3, 4, 10, 5, 11, 7, 13, 6, 12, 0, 14, 8, 15, 1]
// Resulting wiring: [2, 9, 3, 4, 10, 5, 11, 7, 13, 6, 12, 0, 14, 8, 15, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[13], q[14];
cx q[14], q[15];
cx q[11], q[12];
cx q[8], q[15];
cx q[5], q[10];
cx q[5], q[6];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
cx q[1], q[6];
cx q[1], q[2];
cx q[0], q[7];
