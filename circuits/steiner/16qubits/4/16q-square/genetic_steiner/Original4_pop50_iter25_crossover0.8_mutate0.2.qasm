// Initial wiring: [8, 5, 9, 12, 1, 4, 7, 3, 13, 11, 15, 14, 6, 0, 10, 2]
// Resulting wiring: [8, 5, 9, 12, 1, 4, 7, 3, 13, 11, 15, 14, 6, 0, 10, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[11];
