// Initial wiring: [1, 7, 0, 4, 12, 6, 8, 15, 13, 2, 5, 14, 10, 9, 3, 11]
// Resulting wiring: [1, 7, 0, 4, 12, 6, 8, 15, 13, 2, 5, 14, 10, 9, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[11], q[4];
cx q[4], q[3];
cx q[5], q[10];
