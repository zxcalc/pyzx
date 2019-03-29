// Initial wiring: [14, 10, 4, 9, 8, 3, 15, 6, 7, 11, 13, 5, 0, 12, 2, 1]
// Resulting wiring: [14, 10, 4, 9, 8, 3, 15, 6, 7, 11, 13, 5, 0, 12, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[15], q[14];
cx q[5], q[6];
