// Initial wiring: [2, 1, 13, 5, 12, 6, 9, 0, 8, 15, 10, 11, 3, 14, 7, 4]
// Resulting wiring: [2, 1, 13, 5, 12, 6, 9, 0, 8, 15, 10, 11, 3, 14, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[12];
cx q[9], q[14];
cx q[5], q[10];
