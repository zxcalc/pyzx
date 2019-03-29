// Initial wiring: [1, 13, 9, 11, 5, 7, 6, 14, 3, 4, 15, 2, 12, 8, 0, 10]
// Resulting wiring: [1, 13, 9, 11, 5, 7, 6, 14, 3, 4, 15, 2, 12, 8, 0, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[10], q[11];
cx q[4], q[5];
cx q[0], q[7];
