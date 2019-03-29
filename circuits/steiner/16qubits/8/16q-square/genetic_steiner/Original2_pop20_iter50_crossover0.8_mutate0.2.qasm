// Initial wiring: [11, 4, 5, 13, 15, 12, 10, 1, 0, 7, 2, 3, 6, 9, 14, 8]
// Resulting wiring: [11, 4, 5, 13, 15, 12, 10, 1, 0, 7, 2, 3, 6, 9, 14, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[13], q[10];
cx q[14], q[9];
cx q[11], q[12];
cx q[4], q[5];
cx q[5], q[10];
