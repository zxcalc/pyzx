// Initial wiring: [9, 11, 8, 10, 3, 13, 4, 1, 14, 2, 7, 5, 12, 15, 0, 6]
// Resulting wiring: [9, 11, 8, 10, 3, 13, 4, 1, 14, 2, 7, 5, 12, 15, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[8];
cx q[14], q[1];
cx q[13], q[14];
cx q[9], q[10];
cx q[5], q[6];
cx q[2], q[3];
