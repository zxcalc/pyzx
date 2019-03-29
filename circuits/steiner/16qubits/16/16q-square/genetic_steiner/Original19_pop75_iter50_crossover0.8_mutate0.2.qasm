// Initial wiring: [8, 15, 1, 13, 6, 5, 11, 10, 3, 12, 14, 0, 2, 7, 9, 4]
// Resulting wiring: [8, 15, 1, 13, 6, 5, 11, 10, 3, 12, 14, 0, 2, 7, 9, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[8];
cx q[11], q[10];
cx q[14], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[6];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[12], q[13];
cx q[8], q[9];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[0], q[1];
cx q[1], q[2];
