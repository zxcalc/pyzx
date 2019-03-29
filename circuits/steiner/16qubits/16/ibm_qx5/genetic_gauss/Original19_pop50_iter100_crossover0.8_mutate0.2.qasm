// Initial wiring: [11, 10, 7, 9, 3, 0, 15, 5, 13, 6, 14, 8, 4, 1, 12, 2]
// Resulting wiring: [11, 10, 7, 9, 3, 0, 15, 5, 13, 6, 14, 8, 4, 1, 12, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[7], q[0];
cx q[9], q[7];
cx q[11], q[6];
cx q[7], q[1];
cx q[14], q[0];
cx q[12], q[1];
cx q[15], q[2];
cx q[12], q[4];
cx q[8], q[13];
cx q[6], q[13];
cx q[4], q[14];
cx q[3], q[4];
cx q[5], q[10];
