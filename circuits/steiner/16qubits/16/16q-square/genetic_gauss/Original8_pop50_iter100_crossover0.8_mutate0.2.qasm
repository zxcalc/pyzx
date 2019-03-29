// Initial wiring: [0, 7, 13, 6, 11, 4, 14, 12, 1, 9, 8, 15, 5, 3, 10, 2]
// Resulting wiring: [0, 7, 13, 6, 11, 4, 14, 12, 1, 9, 8, 15, 5, 3, 10, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[0];
cx q[7], q[6];
cx q[9], q[1];
cx q[6], q[2];
cx q[8], q[5];
cx q[14], q[13];
cx q[13], q[4];
cx q[13], q[5];
cx q[14], q[9];
cx q[15], q[10];
cx q[9], q[11];
cx q[8], q[12];
cx q[4], q[11];
cx q[2], q[11];
cx q[2], q[3];
cx q[1], q[12];
