// Initial wiring: [15, 3, 9, 1, 13, 11, 8, 10, 2, 4, 5, 6, 0, 12, 7, 14]
// Resulting wiring: [15, 3, 9, 1, 13, 11, 8, 10, 2, 4, 5, 6, 0, 12, 7, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[11], q[12];
cx q[4], q[5];
cx q[5], q[6];
