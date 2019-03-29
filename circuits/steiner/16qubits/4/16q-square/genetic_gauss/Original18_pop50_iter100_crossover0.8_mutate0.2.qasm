// Initial wiring: [6, 1, 9, 11, 0, 7, 5, 10, 3, 12, 15, 14, 4, 13, 2, 8]
// Resulting wiring: [6, 1, 9, 11, 0, 7, 5, 10, 3, 12, 15, 14, 4, 13, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[2];
cx q[10], q[9];
cx q[15], q[13];
cx q[14], q[2];
