// Initial wiring: [5, 6, 4, 10, 2, 1, 7, 12, 0, 11, 13, 8, 15, 3, 14, 9]
// Resulting wiring: [5, 6, 4, 10, 2, 1, 7, 12, 0, 11, 13, 8, 15, 3, 14, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[10], q[9];
cx q[13], q[12];
