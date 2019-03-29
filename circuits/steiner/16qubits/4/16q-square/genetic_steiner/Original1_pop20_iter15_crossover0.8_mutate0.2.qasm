// Initial wiring: [10, 11, 0, 12, 9, 15, 1, 2, 4, 5, 7, 3, 14, 13, 6, 8]
// Resulting wiring: [10, 11, 0, 12, 9, 15, 1, 2, 4, 5, 7, 3, 14, 13, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[10], q[9];
cx q[13], q[12];
cx q[10], q[11];
