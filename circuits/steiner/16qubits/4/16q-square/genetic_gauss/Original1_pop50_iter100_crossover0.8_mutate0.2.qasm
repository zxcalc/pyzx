// Initial wiring: [7, 10, 9, 2, 8, 0, 14, 3, 1, 12, 15, 5, 13, 11, 4, 6]
// Resulting wiring: [7, 10, 9, 2, 8, 0, 14, 3, 1, 12, 15, 5, 13, 11, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[8];
cx q[12], q[6];
cx q[0], q[11];
cx q[0], q[7];
