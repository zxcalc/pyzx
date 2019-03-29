// Initial wiring: [0, 15, 2, 12, 14, 3, 7, 9, 5, 6, 13, 8, 1, 4, 11, 10]
// Resulting wiring: [0, 15, 2, 12, 14, 3, 7, 9, 5, 6, 13, 8, 1, 4, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[13];
cx q[10], q[13];
cx q[2], q[5];
