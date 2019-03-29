// Initial wiring: [8, 13, 11, 1, 4, 6, 9, 15, 10, 12, 14, 5, 0, 2, 3, 7]
// Resulting wiring: [8, 13, 11, 1, 4, 6, 9, 15, 10, 12, 14, 5, 0, 2, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[11], q[10];
cx q[10], q[5];
cx q[13], q[12];
cx q[14], q[9];
cx q[15], q[8];
cx q[11], q[12];
cx q[9], q[10];
