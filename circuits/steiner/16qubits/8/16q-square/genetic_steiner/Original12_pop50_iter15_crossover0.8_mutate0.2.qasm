// Initial wiring: [9, 13, 8, 2, 14, 0, 6, 11, 10, 3, 4, 15, 7, 12, 5, 1]
// Resulting wiring: [9, 13, 8, 2, 14, 0, 6, 11, 10, 3, 4, 15, 7, 12, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[4];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[14], q[13];
cx q[14], q[9];
cx q[8], q[9];
