// Initial wiring: [2, 1, 9, 10, 12, 3, 0, 6, 14, 15, 13, 7, 5, 11, 4, 8]
// Resulting wiring: [2, 1, 9, 10, 12, 3, 0, 6, 14, 15, 13, 7, 5, 11, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[13], q[12];
cx q[10], q[11];
cx q[3], q[4];
