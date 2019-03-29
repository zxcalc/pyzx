// Initial wiring: [2, 14, 3, 12, 1, 13, 10, 8, 7, 11, 6, 5, 9, 15, 4, 0]
// Resulting wiring: [2, 14, 3, 12, 1, 13, 10, 8, 7, 11, 6, 5, 9, 15, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[14], q[13];
cx q[4], q[11];
cx q[1], q[2];
