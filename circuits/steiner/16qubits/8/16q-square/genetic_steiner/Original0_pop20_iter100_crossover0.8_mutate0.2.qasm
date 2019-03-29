// Initial wiring: [15, 8, 12, 3, 5, 14, 6, 4, 9, 11, 13, 0, 2, 10, 7, 1]
// Resulting wiring: [15, 8, 12, 3, 5, 14, 6, 4, 9, 11, 13, 0, 2, 10, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[12], q[11];
cx q[14], q[13];
cx q[4], q[5];
cx q[4], q[11];
cx q[5], q[6];
cx q[2], q[5];
cx q[0], q[1];
