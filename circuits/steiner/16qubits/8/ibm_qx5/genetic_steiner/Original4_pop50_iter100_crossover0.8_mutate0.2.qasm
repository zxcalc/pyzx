// Initial wiring: [6, 12, 14, 15, 1, 13, 9, 3, 8, 2, 5, 4, 10, 0, 11, 7]
// Resulting wiring: [6, 12, 14, 15, 1, 13, 9, 3, 8, 2, 5, 4, 10, 0, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[11], q[10];
cx q[14], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[3], q[12];
cx q[3], q[4];
