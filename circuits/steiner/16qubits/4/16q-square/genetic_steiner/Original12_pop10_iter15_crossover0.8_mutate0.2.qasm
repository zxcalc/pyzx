// Initial wiring: [5, 8, 0, 6, 10, 3, 2, 4, 15, 13, 7, 1, 11, 14, 12, 9]
// Resulting wiring: [5, 8, 0, 6, 10, 3, 2, 4, 15, 13, 7, 1, 11, 14, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[13], q[12];
cx q[11], q[12];
cx q[5], q[6];
