// Initial wiring: [1, 12, 15, 9, 6, 4, 11, 2, 8, 3, 7, 10, 14, 13, 5, 0]
// Resulting wiring: [1, 12, 15, 9, 6, 4, 11, 2, 8, 3, 7, 10, 14, 13, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[11], q[10];
cx q[11], q[4];
cx q[13], q[10];
cx q[8], q[15];
cx q[6], q[9];
cx q[9], q[10];
