// Initial wiring: [7, 6, 4, 8, 2, 10, 12, 13, 11, 5, 14, 1, 15, 3, 9, 0]
// Resulting wiring: [7, 6, 4, 8, 2, 10, 12, 13, 11, 5, 14, 1, 15, 3, 9, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[13], q[12];
cx q[7], q[8];
cx q[0], q[1];
