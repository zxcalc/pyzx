// Initial wiring: [4, 3, 11, 10, 12, 6, 7, 0, 8, 5, 9, 13, 14, 2, 1, 15]
// Resulting wiring: [4, 3, 11, 10, 12, 6, 7, 0, 8, 5, 9, 13, 14, 2, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[12];
cx q[9], q[14];
cx q[6], q[9];
