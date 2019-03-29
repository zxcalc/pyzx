// Initial wiring: [8, 9, 12, 10, 6, 3, 15, 0, 5, 1, 2, 7, 4, 14, 11, 13]
// Resulting wiring: [8, 9, 12, 10, 6, 3, 15, 0, 5, 1, 2, 7, 4, 14, 11, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[15], q[14];
cx q[9], q[10];
cx q[5], q[6];
