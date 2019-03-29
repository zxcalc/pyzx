// Initial wiring: [12, 2, 3, 9, 13, 10, 6, 7, 1, 11, 14, 8, 5, 0, 15, 4]
// Resulting wiring: [12, 2, 3, 9, 13, 10, 6, 7, 1, 11, 14, 8, 5, 0, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[9];
cx q[14], q[15];
cx q[8], q[9];
