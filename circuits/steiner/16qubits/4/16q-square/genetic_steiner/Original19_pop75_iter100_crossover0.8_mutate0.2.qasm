// Initial wiring: [12, 10, 3, 6, 8, 0, 2, 9, 1, 4, 13, 5, 11, 14, 15, 7]
// Resulting wiring: [12, 10, 3, 6, 8, 0, 2, 9, 1, 4, 13, 5, 11, 14, 15, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[9];
cx q[12], q[13];
cx q[6], q[9];
