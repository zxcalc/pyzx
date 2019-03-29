// Initial wiring: [11, 0, 7, 4, 3, 14, 8, 10, 6, 13, 15, 12, 9, 2, 5, 1]
// Resulting wiring: [11, 0, 7, 4, 3, 14, 8, 10, 6, 13, 15, 12, 9, 2, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[11], q[12];
cx q[10], q[11];
cx q[6], q[9];
