// Initial wiring: [2, 12, 0, 1, 10, 7, 4, 9, 5, 3, 11, 6, 15, 14, 13, 8]
// Resulting wiring: [2, 12, 0, 1, 10, 7, 4, 9, 5, 3, 11, 6, 15, 14, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[14], q[9];
cx q[12], q[13];
cx q[7], q[8];
