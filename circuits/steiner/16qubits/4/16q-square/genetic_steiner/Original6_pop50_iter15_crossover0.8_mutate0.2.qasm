// Initial wiring: [7, 9, 14, 10, 11, 6, 15, 2, 13, 4, 0, 5, 8, 1, 3, 12]
// Resulting wiring: [7, 9, 14, 10, 11, 6, 15, 2, 13, 4, 0, 5, 8, 1, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[3], q[2];
cx q[11], q[4];
cx q[8], q[9];
