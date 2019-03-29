// Initial wiring: [6, 3, 13, 4, 1, 0, 11, 10, 15, 8, 14, 9, 5, 2, 7, 12]
// Resulting wiring: [6, 3, 13, 4, 1, 0, 11, 10, 15, 8, 14, 9, 5, 2, 7, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[13], q[10];
cx q[13], q[14];
cx q[5], q[6];
cx q[2], q[3];
