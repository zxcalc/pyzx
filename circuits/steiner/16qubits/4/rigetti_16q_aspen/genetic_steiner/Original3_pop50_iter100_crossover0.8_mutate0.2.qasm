// Initial wiring: [7, 5, 0, 10, 11, 6, 12, 8, 14, 2, 15, 4, 3, 13, 9, 1]
// Resulting wiring: [7, 5, 0, 10, 11, 6, 12, 8, 14, 2, 15, 4, 3, 13, 9, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[10], q[9];
cx q[15], q[8];
