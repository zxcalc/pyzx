// Initial wiring: [3, 2, 13, 12, 10, 0, 9, 5, 7, 11, 14, 6, 4, 15, 1, 8]
// Resulting wiring: [3, 2, 13, 12, 10, 0, 9, 5, 7, 11, 14, 6, 4, 15, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[13], q[12];
cx q[14], q[9];
cx q[0], q[1];
