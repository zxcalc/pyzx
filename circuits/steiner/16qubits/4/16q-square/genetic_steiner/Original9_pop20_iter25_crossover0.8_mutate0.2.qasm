// Initial wiring: [10, 15, 14, 1, 6, 8, 2, 11, 4, 5, 9, 13, 7, 12, 3, 0]
// Resulting wiring: [10, 15, 14, 1, 6, 8, 2, 11, 4, 5, 9, 13, 7, 12, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[11], q[4];
cx q[13], q[12];
