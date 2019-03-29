// Initial wiring: [8, 2, 9, 13, 12, 5, 3, 10, 15, 7, 6, 0, 4, 14, 1, 11]
// Resulting wiring: [8, 2, 9, 13, 12, 5, 3, 10, 15, 7, 6, 0, 4, 14, 1, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[8];
cx q[12], q[11];
cx q[12], q[13];
cx q[5], q[6];
