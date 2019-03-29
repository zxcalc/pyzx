// Initial wiring: [5, 0, 13, 1, 12, 8, 6, 9, 15, 11, 3, 4, 2, 10, 7, 14]
// Resulting wiring: [5, 0, 13, 1, 12, 8, 6, 9, 15, 11, 3, 4, 2, 10, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[13];
cx q[9], q[14];
cx q[14], q[13];
cx q[6], q[9];
