// Initial wiring: [15, 14, 12, 8, 9, 10, 7, 6, 1, 13, 4, 11, 3, 2, 5, 0]
// Resulting wiring: [15, 14, 12, 8, 9, 10, 7, 6, 1, 13, 4, 11, 3, 2, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[13], q[12];
cx q[9], q[10];
cx q[1], q[2];
