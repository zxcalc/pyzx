// Initial wiring: [1, 5, 11, 13, 7, 15, 6, 0, 3, 14, 10, 12, 2, 8, 9, 4]
// Resulting wiring: [1, 5, 11, 13, 7, 15, 6, 0, 3, 14, 10, 12, 2, 8, 9, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[10], q[11];
cx q[7], q[8];
cx q[3], q[4];
