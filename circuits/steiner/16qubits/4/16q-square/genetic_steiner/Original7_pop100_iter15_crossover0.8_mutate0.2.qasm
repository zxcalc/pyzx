// Initial wiring: [10, 7, 0, 2, 15, 8, 4, 3, 6, 11, 9, 12, 13, 1, 5, 14]
// Resulting wiring: [10, 7, 0, 2, 15, 8, 4, 3, 6, 11, 9, 12, 13, 1, 5, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[6], q[9];
cx q[9], q[10];
cx q[4], q[11];
