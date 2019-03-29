// Initial wiring: [8, 12, 6, 2, 15, 7, 0, 9, 4, 3, 11, 1, 5, 13, 14, 10]
// Resulting wiring: [8, 12, 6, 2, 15, 7, 0, 9, 4, 3, 11, 1, 5, 13, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[11];
cx q[11], q[13];
cx q[0], q[11];
cx q[0], q[8];
