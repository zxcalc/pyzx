// Initial wiring: [12, 15, 13, 9, 11, 10, 5, 7, 2, 3, 1, 6, 8, 4, 0, 14]
// Resulting wiring: [12, 15, 13, 9, 11, 10, 5, 7, 2, 3, 1, 6, 8, 4, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[13], q[10];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
