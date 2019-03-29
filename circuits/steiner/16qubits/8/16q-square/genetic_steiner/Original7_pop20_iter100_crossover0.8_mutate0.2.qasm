// Initial wiring: [5, 9, 13, 14, 11, 7, 3, 4, 6, 10, 0, 2, 15, 8, 1, 12]
// Resulting wiring: [5, 9, 13, 14, 11, 7, 3, 4, 6, 10, 0, 2, 15, 8, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[8];
cx q[9], q[6];
cx q[11], q[4];
cx q[13], q[10];
cx q[7], q[8];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[2], q[5];
