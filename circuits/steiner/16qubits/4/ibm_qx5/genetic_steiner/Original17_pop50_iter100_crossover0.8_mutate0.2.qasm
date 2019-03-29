// Initial wiring: [12, 1, 15, 2, 3, 14, 7, 8, 5, 9, 11, 0, 10, 13, 4, 6]
// Resulting wiring: [12, 1, 15, 2, 3, 14, 7, 8, 5, 9, 11, 0, 10, 13, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[11], q[4];
cx q[14], q[1];
