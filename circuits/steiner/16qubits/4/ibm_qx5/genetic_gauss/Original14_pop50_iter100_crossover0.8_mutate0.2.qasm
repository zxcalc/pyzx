// Initial wiring: [12, 5, 4, 10, 11, 14, 6, 8, 15, 3, 13, 7, 2, 9, 1, 0]
// Resulting wiring: [12, 5, 4, 10, 11, 14, 6, 8, 15, 3, 13, 7, 2, 9, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[6], q[3];
cx q[8], q[11];
cx q[4], q[9];
