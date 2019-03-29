// Initial wiring: [11, 6, 1, 12, 9, 2, 14, 3, 10, 15, 7, 13, 4, 0, 8, 5]
// Resulting wiring: [11, 6, 1, 12, 9, 2, 14, 3, 10, 15, 7, 13, 4, 0, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[11], q[4];
cx q[13], q[10];
cx q[6], q[7];
cx q[3], q[4];
cx q[2], q[3];
cx q[0], q[1];
