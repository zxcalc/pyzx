// Initial wiring: [3, 11, 2, 1, 13, 8, 5, 14, 7, 15, 10, 6, 12, 9, 4, 0]
// Resulting wiring: [3, 11, 2, 1, 13, 8, 5, 14, 7, 15, 10, 6, 12, 9, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[11], q[10];
cx q[11], q[12];
