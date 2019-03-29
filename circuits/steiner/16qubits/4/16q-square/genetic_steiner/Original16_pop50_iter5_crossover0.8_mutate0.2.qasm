// Initial wiring: [7, 6, 14, 4, 11, 13, 2, 1, 8, 15, 3, 10, 5, 0, 9, 12]
// Resulting wiring: [7, 6, 14, 4, 11, 13, 2, 1, 8, 15, 3, 10, 5, 0, 9, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[10], q[9];
cx q[0], q[1];
