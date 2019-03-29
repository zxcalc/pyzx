// Initial wiring: [6, 14, 0, 5, 2, 1, 8, 7, 4, 3, 13, 10, 12, 11, 15, 9]
// Resulting wiring: [6, 14, 0, 5, 2, 1, 8, 7, 4, 3, 13, 10, 12, 11, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[10], q[9];
cx q[9], q[8];
cx q[11], q[10];
cx q[14], q[13];
cx q[9], q[14];
cx q[2], q[5];
