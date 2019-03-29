// Initial wiring: [6, 15, 14, 1, 12, 13, 3, 0, 4, 11, 7, 10, 2, 5, 9, 8]
// Resulting wiring: [6, 15, 14, 1, 12, 13, 3, 0, 4, 11, 7, 10, 2, 5, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[9], q[10];
cx q[5], q[6];
cx q[1], q[2];
