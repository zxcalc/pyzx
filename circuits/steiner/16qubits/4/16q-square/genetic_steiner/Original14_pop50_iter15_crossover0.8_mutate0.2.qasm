// Initial wiring: [0, 2, 14, 5, 11, 3, 8, 1, 12, 6, 10, 4, 9, 7, 15, 13]
// Resulting wiring: [0, 2, 14, 5, 11, 3, 8, 1, 12, 6, 10, 4, 9, 7, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[14], q[13];
cx q[9], q[10];
cx q[4], q[5];
