// Initial wiring: [8, 0, 1, 14, 9, 3, 11, 2, 5, 13, 7, 10, 6, 4, 12, 15]
// Resulting wiring: [8, 0, 1, 14, 9, 3, 11, 2, 5, 13, 7, 10, 6, 4, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[11], q[10];
cx q[13], q[12];
cx q[11], q[12];
cx q[9], q[10];
cx q[5], q[10];
cx q[0], q[1];
