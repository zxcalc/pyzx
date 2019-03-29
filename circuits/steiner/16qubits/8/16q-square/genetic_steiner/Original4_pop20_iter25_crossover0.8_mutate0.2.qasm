// Initial wiring: [8, 5, 1, 14, 7, 3, 4, 2, 9, 10, 15, 12, 13, 11, 0, 6]
// Resulting wiring: [8, 5, 1, 14, 7, 3, 4, 2, 9, 10, 15, 12, 13, 11, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[9];
cx q[10], q[5];
cx q[13], q[14];
cx q[7], q[8];
cx q[8], q[7];
cx q[0], q[7];
cx q[0], q[1];
