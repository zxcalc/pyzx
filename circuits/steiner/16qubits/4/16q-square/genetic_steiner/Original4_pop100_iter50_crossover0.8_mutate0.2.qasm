// Initial wiring: [13, 0, 1, 11, 7, 2, 12, 3, 9, 5, 8, 15, 14, 10, 6, 4]
// Resulting wiring: [13, 0, 1, 11, 7, 2, 12, 3, 9, 5, 8, 15, 14, 10, 6, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[12];
cx q[8], q[9];
cx q[3], q[4];
cx q[0], q[7];
