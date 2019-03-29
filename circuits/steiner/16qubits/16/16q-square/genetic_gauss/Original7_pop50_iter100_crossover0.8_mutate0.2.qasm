// Initial wiring: [6, 0, 1, 13, 4, 2, 11, 9, 12, 10, 15, 14, 5, 3, 8, 7]
// Resulting wiring: [6, 0, 1, 13, 4, 2, 11, 9, 12, 10, 15, 14, 5, 3, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[2];
cx q[12], q[3];
cx q[13], q[12];
cx q[15], q[13];
cx q[12], q[0];
cx q[15], q[10];
cx q[14], q[15];
cx q[9], q[10];
cx q[6], q[14];
cx q[9], q[12];
cx q[2], q[3];
cx q[4], q[8];
