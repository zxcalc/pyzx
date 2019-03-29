// Initial wiring: [7, 2, 6, 12, 15, 10, 9, 3, 8, 14, 0, 4, 13, 5, 11, 1]
// Resulting wiring: [7, 2, 6, 12, 15, 10, 9, 3, 8, 14, 0, 4, 13, 5, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[9];
cx q[13], q[15];
cx q[0], q[13];
cx q[0], q[7];
