// Initial wiring: [8, 9, 15, 13, 11, 12, 2, 14, 7, 6, 3, 4, 10, 1, 0, 5]
// Resulting wiring: [8, 9, 15, 13, 11, 12, 2, 14, 7, 6, 3, 4, 10, 1, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[13];
cx q[7], q[8];
cx q[2], q[5];
cx q[5], q[6];
cx q[1], q[6];
