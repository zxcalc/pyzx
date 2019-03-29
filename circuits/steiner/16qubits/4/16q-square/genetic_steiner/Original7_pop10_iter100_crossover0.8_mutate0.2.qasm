// Initial wiring: [4, 11, 0, 3, 10, 14, 9, 6, 7, 1, 5, 13, 2, 12, 15, 8]
// Resulting wiring: [4, 11, 0, 3, 10, 14, 9, 6, 7, 1, 5, 13, 2, 12, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[13];
cx q[0], q[1];
cx q[1], q[6];
