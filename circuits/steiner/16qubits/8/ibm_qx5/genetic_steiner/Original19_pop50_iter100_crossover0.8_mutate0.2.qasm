// Initial wiring: [3, 15, 11, 7, 8, 1, 13, 2, 0, 9, 5, 4, 14, 12, 10, 6]
// Resulting wiring: [3, 15, 11, 7, 8, 1, 13, 2, 0, 9, 5, 4, 14, 12, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[2];
cx q[2], q[1];
cx q[12], q[13];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
