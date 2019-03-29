// Initial wiring: [11, 8, 2, 14, 0, 1, 4, 9, 15, 3, 5, 7, 6, 10, 13, 12]
// Resulting wiring: [11, 8, 2, 14, 0, 1, 4, 9, 15, 3, 5, 7, 6, 10, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[14], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[13], q[14];
cx q[4], q[5];
