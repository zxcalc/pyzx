// Initial wiring: [8, 0, 10, 7, 13, 6, 1, 5, 4, 11, 14, 3, 2, 12, 9, 15]
// Resulting wiring: [8, 0, 10, 7, 13, 6, 1, 5, 4, 11, 14, 3, 2, 12, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[15], q[8];
cx q[11], q[12];
cx q[6], q[9];
