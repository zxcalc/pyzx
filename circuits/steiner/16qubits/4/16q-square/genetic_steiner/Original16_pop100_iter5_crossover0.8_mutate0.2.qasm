// Initial wiring: [1, 3, 5, 13, 11, 4, 15, 2, 14, 6, 0, 10, 8, 9, 7, 12]
// Resulting wiring: [1, 3, 5, 13, 11, 4, 15, 2, 14, 6, 0, 10, 8, 9, 7, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[3], q[4];
cx q[1], q[6];
cx q[0], q[7];
