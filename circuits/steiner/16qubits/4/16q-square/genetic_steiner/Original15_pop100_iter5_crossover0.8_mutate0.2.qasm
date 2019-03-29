// Initial wiring: [0, 11, 15, 1, 5, 6, 14, 9, 4, 12, 2, 7, 3, 13, 10, 8]
// Resulting wiring: [0, 11, 15, 1, 5, 6, 14, 9, 4, 12, 2, 7, 3, 13, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[13];
cx q[6], q[9];
cx q[9], q[8];
