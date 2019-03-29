// Initial wiring: [10, 3, 2, 4, 1, 13, 6, 0, 5, 9, 11, 7, 12, 8, 14, 15]
// Resulting wiring: [10, 3, 2, 4, 1, 13, 6, 0, 5, 9, 11, 7, 12, 8, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[7];
cx q[5], q[10];
cx q[10], q[13];
