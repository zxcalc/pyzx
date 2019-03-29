// Initial wiring: [10, 3, 5, 12, 1, 2, 8, 11, 0, 6, 9, 15, 7, 13, 14, 4]
// Resulting wiring: [10, 3, 5, 12, 1, 2, 8, 11, 0, 6, 9, 15, 7, 13, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[12], q[11];
cx q[13], q[10];
cx q[15], q[14];
cx q[15], q[8];
cx q[5], q[6];
cx q[2], q[3];
cx q[0], q[1];
