// Initial wiring: [3, 5, 11, 1, 2, 0, 14, 12, 13, 6, 8, 15, 9, 7, 10, 4]
// Resulting wiring: [3, 5, 11, 1, 2, 0, 14, 12, 13, 6, 8, 15, 9, 7, 10, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[11], q[10];
cx q[13], q[14];
cx q[4], q[5];
cx q[1], q[6];
cx q[6], q[9];
cx q[6], q[5];
cx q[0], q[7];
cx q[7], q[6];
