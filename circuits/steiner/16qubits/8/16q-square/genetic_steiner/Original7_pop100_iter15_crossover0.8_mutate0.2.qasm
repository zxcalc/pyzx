// Initial wiring: [9, 1, 7, 13, 10, 3, 11, 2, 0, 8, 5, 6, 4, 15, 14, 12]
// Resulting wiring: [9, 1, 7, 13, 10, 3, 11, 2, 0, 8, 5, 6, 4, 15, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[12], q[11];
cx q[4], q[11];
