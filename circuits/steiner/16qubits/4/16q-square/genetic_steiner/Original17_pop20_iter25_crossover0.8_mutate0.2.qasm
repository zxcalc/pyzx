// Initial wiring: [15, 13, 9, 11, 1, 8, 3, 0, 10, 14, 12, 4, 2, 6, 5, 7]
// Resulting wiring: [15, 13, 9, 11, 1, 8, 3, 0, 10, 14, 12, 4, 2, 6, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[9], q[6];
cx q[11], q[4];
