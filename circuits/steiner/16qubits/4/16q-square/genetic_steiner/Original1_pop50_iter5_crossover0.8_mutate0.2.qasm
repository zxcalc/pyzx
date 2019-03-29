// Initial wiring: [14, 13, 15, 10, 9, 7, 2, 8, 6, 3, 5, 1, 4, 11, 12, 0]
// Resulting wiring: [14, 13, 15, 10, 9, 7, 2, 8, 6, 3, 5, 1, 4, 11, 12, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[9];
cx q[10], q[11];
cx q[5], q[10];
cx q[10], q[9];
