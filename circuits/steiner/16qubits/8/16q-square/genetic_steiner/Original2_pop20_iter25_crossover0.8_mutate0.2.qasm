// Initial wiring: [10, 1, 4, 11, 5, 8, 0, 13, 15, 12, 2, 3, 6, 9, 7, 14]
// Resulting wiring: [10, 1, 4, 11, 5, 8, 0, 13, 15, 12, 2, 3, 6, 9, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[1];
cx q[13], q[10];
cx q[15], q[14];
cx q[11], q[12];
cx q[8], q[9];
cx q[9], q[10];
cx q[2], q[3];
