// Initial wiring: [14, 9, 2, 8, 4, 5, 7, 13, 12, 6, 3, 10, 15, 1, 0, 11]
// Resulting wiring: [14, 9, 2, 8, 4, 5, 7, 13, 12, 6, 3, 10, 15, 1, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[12], q[11];
cx q[15], q[14];
cx q[12], q[13];
cx q[4], q[5];
cx q[2], q[5];
cx q[1], q[2];
