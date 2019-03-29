// Initial wiring: [7, 6, 0, 4, 9, 2, 11, 1, 13, 14, 3, 12, 15, 5, 10, 8]
// Resulting wiring: [7, 6, 0, 4, 9, 2, 11, 1, 13, 14, 3, 12, 15, 5, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[4];
cx q[12], q[11];
cx q[15], q[8];
