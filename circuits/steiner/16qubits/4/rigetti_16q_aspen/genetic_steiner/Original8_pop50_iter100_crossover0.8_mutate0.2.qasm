// Initial wiring: [4, 6, 0, 7, 8, 11, 13, 1, 10, 15, 3, 14, 9, 5, 2, 12]
// Resulting wiring: [4, 6, 0, 7, 8, 11, 13, 1, 10, 15, 3, 14, 9, 5, 2, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[7];
cx q[1], q[2];
