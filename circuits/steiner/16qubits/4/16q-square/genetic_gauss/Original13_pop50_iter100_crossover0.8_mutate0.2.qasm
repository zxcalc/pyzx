// Initial wiring: [10, 3, 14, 8, 1, 9, 0, 5, 15, 12, 6, 7, 4, 11, 13, 2]
// Resulting wiring: [10, 3, 14, 8, 1, 9, 0, 5, 15, 12, 6, 7, 4, 11, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[14], q[12];
cx q[15], q[1];
cx q[2], q[9];
