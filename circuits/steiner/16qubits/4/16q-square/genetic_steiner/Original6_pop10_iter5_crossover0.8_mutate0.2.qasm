// Initial wiring: [1, 8, 0, 3, 9, 4, 5, 6, 2, 10, 7, 15, 12, 13, 11, 14]
// Resulting wiring: [1, 8, 0, 3, 9, 4, 5, 6, 2, 10, 7, 15, 12, 13, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[9], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[9];
