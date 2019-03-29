// Initial wiring: [13, 12, 8, 0, 15, 6, 7, 11, 10, 2, 4, 3, 9, 5, 1, 14]
// Resulting wiring: [13, 12, 8, 0, 15, 6, 7, 11, 10, 2, 4, 3, 9, 5, 1, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[11], q[4];
cx q[14], q[9];
cx q[0], q[7];
