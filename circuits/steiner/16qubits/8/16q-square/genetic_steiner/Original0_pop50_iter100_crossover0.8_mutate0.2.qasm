// Initial wiring: [3, 12, 9, 13, 1, 5, 14, 8, 15, 6, 0, 2, 10, 7, 11, 4]
// Resulting wiring: [3, 12, 9, 13, 1, 5, 14, 8, 15, 6, 0, 2, 10, 7, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[11], q[10];
cx q[13], q[12];
cx q[5], q[6];
cx q[5], q[10];
cx q[6], q[9];
cx q[0], q[1];
cx q[1], q[6];
