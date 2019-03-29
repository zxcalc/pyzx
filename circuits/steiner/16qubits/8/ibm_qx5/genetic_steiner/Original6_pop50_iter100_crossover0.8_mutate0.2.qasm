// Initial wiring: [15, 10, 0, 14, 2, 13, 4, 1, 3, 7, 9, 8, 12, 5, 11, 6]
// Resulting wiring: [15, 10, 0, 14, 2, 13, 4, 1, 3, 7, 9, 8, 12, 5, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[4];
cx q[13], q[12];
cx q[15], q[14];
cx q[5], q[10];
cx q[3], q[4];
cx q[0], q[15];
