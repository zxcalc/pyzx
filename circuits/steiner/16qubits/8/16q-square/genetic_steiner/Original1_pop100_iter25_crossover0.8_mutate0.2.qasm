// Initial wiring: [12, 6, 11, 8, 10, 4, 13, 9, 1, 2, 7, 5, 15, 0, 3, 14]
// Resulting wiring: [12, 6, 11, 8, 10, 4, 13, 9, 1, 2, 7, 5, 15, 0, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[0];
cx q[9], q[8];
cx q[13], q[10];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[14];
cx q[7], q[0];
cx q[6], q[7];
cx q[0], q[7];
