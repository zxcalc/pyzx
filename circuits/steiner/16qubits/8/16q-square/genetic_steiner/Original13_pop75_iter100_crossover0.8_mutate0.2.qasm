// Initial wiring: [15, 7, 1, 5, 8, 6, 11, 14, 12, 9, 13, 4, 2, 10, 0, 3]
// Resulting wiring: [15, 7, 1, 5, 8, 6, 11, 14, 12, 9, 13, 4, 2, 10, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[4];
cx q[14], q[9];
cx q[9], q[8];
cx q[10], q[11];
cx q[6], q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[5], q[10];
cx q[6], q[9];
