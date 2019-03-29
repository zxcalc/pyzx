// Initial wiring: [9, 12, 7, 10, 14, 4, 5, 15, 13, 6, 2, 11, 3, 8, 0, 1]
// Resulting wiring: [9, 12, 7, 10, 14, 4, 5, 15, 13, 6, 2, 11, 3, 8, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[10], q[13];
cx q[8], q[9];
cx q[1], q[2];
