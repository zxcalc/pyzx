// Initial wiring: [8, 7, 2, 5, 1, 14, 11, 9, 0, 4, 12, 3, 6, 15, 10, 13]
// Resulting wiring: [8, 7, 2, 5, 1, 14, 11, 9, 0, 4, 12, 3, 6, 15, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[13], q[10];
cx q[6], q[7];
cx q[3], q[4];
