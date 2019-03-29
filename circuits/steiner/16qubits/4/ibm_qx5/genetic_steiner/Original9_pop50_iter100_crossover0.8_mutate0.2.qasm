// Initial wiring: [0, 10, 7, 12, 9, 3, 2, 11, 1, 8, 6, 13, 15, 5, 14, 4]
// Resulting wiring: [0, 10, 7, 12, 9, 3, 2, 11, 1, 8, 6, 13, 15, 5, 14, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[11], q[10];
cx q[6], q[9];
