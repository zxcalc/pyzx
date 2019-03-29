// Initial wiring: [12, 13, 8, 2, 3, 11, 10, 6, 5, 7, 15, 4, 0, 9, 14, 1]
// Resulting wiring: [12, 13, 8, 2, 3, 11, 10, 6, 5, 7, 15, 4, 0, 9, 14, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[7], q[0];
cx q[10], q[9];
