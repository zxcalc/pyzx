// Initial wiring: [11, 2, 4, 5, 0, 15, 8, 14, 3, 10, 7, 13, 6, 12, 1, 9]
// Resulting wiring: [11, 2, 4, 5, 0, 15, 8, 14, 3, 10, 7, 13, 6, 12, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[11], q[12];
cx q[0], q[1];
cx q[1], q[6];
