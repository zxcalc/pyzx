// Initial wiring: [6, 8, 3, 5, 0, 1, 10, 4, 9, 13, 12, 15, 7, 14, 2, 11]
// Resulting wiring: [6, 8, 3, 5, 0, 1, 10, 4, 9, 13, 12, 15, 7, 14, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[8], q[15];
cx q[15], q[14];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[8];
cx q[5], q[6];
cx q[4], q[5];
