// Initial wiring: [2, 3, 1, 11, 14, 6, 12, 13, 0, 8, 5, 7, 10, 4, 15, 9]
// Resulting wiring: [2, 3, 1, 11, 14, 6, 12, 13, 0, 8, 5, 7, 10, 4, 15, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[14], q[13];
cx q[2], q[3];
