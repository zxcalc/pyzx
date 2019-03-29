// Initial wiring: [5, 7, 9, 12, 4, 3, 13, 10, 2, 1, 15, 8, 6, 11, 0, 14]
// Resulting wiring: [5, 7, 9, 12, 4, 3, 13, 10, 2, 1, 15, 8, 6, 11, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[8];
cx q[14], q[9];
cx q[14], q[15];
cx q[10], q[13];
cx q[5], q[10];
