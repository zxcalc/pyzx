// Initial wiring: [9, 6, 2, 7, 3, 10, 1, 11, 4, 5, 13, 15, 12, 0, 8, 14]
// Resulting wiring: [9, 6, 2, 7, 3, 10, 1, 11, 4, 5, 13, 15, 12, 0, 8, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[9], q[6];
cx q[11], q[12];
