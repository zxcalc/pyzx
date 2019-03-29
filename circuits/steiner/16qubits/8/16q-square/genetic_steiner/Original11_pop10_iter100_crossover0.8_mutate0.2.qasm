// Initial wiring: [15, 2, 9, 10, 8, 14, 4, 1, 0, 11, 6, 3, 12, 13, 7, 5]
// Resulting wiring: [15, 2, 9, 10, 8, 14, 4, 1, 0, 11, 6, 3, 12, 13, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[8];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[4], q[11];
cx q[1], q[2];
