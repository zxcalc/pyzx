// Initial wiring: [0, 12, 15, 13, 5, 11, 10, 2, 9, 14, 4, 7, 6, 3, 1, 8]
// Resulting wiring: [0, 12, 15, 13, 5, 11, 10, 2, 9, 14, 4, 7, 6, 3, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[2];
cx q[14], q[4];
cx q[6], q[9];
cx q[9], q[13];
