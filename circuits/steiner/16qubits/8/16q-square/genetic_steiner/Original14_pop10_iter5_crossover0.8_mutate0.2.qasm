// Initial wiring: [15, 0, 9, 1, 12, 8, 3, 13, 7, 14, 11, 5, 4, 6, 2, 10]
// Resulting wiring: [15, 0, 9, 1, 12, 8, 3, 13, 7, 14, 11, 5, 4, 6, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[10], q[9];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[14], q[15];
cx q[8], q[15];
