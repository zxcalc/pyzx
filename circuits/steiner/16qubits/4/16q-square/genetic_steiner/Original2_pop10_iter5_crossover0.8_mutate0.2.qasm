// Initial wiring: [0, 1, 6, 13, 10, 4, 11, 3, 2, 12, 15, 5, 9, 7, 8, 14]
// Resulting wiring: [0, 1, 6, 13, 10, 4, 11, 3, 2, 12, 15, 5, 9, 7, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[6];
cx q[13], q[12];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[2], q[5];
