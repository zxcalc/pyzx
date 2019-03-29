// Initial wiring: [5, 7, 12, 14, 3, 1, 11, 10, 15, 2, 8, 9, 6, 13, 0, 4]
// Resulting wiring: [5, 7, 12, 14, 3, 1, 11, 10, 15, 2, 8, 9, 6, 13, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[13], q[12];
cx q[6], q[9];
cx q[9], q[10];
