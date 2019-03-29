// Initial wiring: [0, 1, 13, 11, 12, 8, 15, 10, 2, 9, 6, 3, 4, 5, 14, 7]
// Resulting wiring: [0, 1, 13, 11, 12, 8, 15, 10, 2, 9, 6, 3, 4, 5, 14, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[3];
cx q[12], q[0];
cx q[8], q[13];
cx q[11], q[12];
cx q[5], q[8];
cx q[3], q[8];
cx q[0], q[2];
cx q[4], q[6];
