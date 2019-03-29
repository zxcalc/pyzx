// Initial wiring: [3, 13, 7, 12, 8, 4, 1, 9, 11, 6, 14, 10, 5, 15, 0, 2]
// Resulting wiring: [3, 13, 7, 12, 8, 4, 1, 9, 11, 6, 14, 10, 5, 15, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
