// Initial wiring: [12, 10, 9, 15, 5, 11, 2, 8, 4, 6, 13, 7, 1, 14, 0, 3]
// Resulting wiring: [12, 10, 9, 15, 5, 11, 2, 8, 4, 6, 13, 7, 1, 14, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[14], q[15];
cx q[10], q[11];
