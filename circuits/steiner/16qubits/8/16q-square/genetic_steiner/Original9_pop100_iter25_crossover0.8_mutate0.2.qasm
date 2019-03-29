// Initial wiring: [0, 4, 5, 14, 6, 3, 1, 15, 7, 13, 11, 12, 10, 8, 2, 9]
// Resulting wiring: [0, 4, 5, 14, 6, 3, 1, 15, 7, 13, 11, 12, 10, 8, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[4], q[3];
cx q[12], q[11];
cx q[13], q[12];
cx q[13], q[14];
