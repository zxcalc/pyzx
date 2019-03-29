// Initial wiring: [0, 11, 10, 7, 5, 9, 4, 13, 1, 3, 2, 8, 12, 14, 6, 15]
// Resulting wiring: [0, 11, 10, 7, 5, 9, 4, 13, 1, 3, 2, 8, 12, 14, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[9];
cx q[13], q[12];
cx q[1], q[6];
