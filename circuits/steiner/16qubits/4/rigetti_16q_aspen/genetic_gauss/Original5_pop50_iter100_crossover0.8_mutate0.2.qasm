// Initial wiring: [14, 15, 8, 3, 12, 1, 2, 11, 7, 10, 4, 13, 0, 6, 5, 9]
// Resulting wiring: [14, 15, 8, 3, 12, 1, 2, 11, 7, 10, 4, 13, 0, 6, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[9];
cx q[7], q[2];
cx q[14], q[11];
cx q[3], q[4];
