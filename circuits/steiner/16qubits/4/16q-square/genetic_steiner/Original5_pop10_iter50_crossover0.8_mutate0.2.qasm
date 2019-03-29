// Initial wiring: [4, 6, 15, 9, 14, 5, 13, 10, 2, 12, 3, 0, 7, 1, 11, 8]
// Resulting wiring: [4, 6, 15, 9, 14, 5, 13, 10, 2, 12, 3, 0, 7, 1, 11, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[15];
cx q[6], q[7];
cx q[5], q[6];
