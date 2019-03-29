// Initial wiring: [3, 4, 10, 9, 12, 11, 1, 7, 2, 13, 8, 6, 0, 14, 5, 15]
// Resulting wiring: [3, 4, 10, 9, 12, 11, 1, 7, 2, 13, 8, 6, 0, 14, 5, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[11], q[12];
cx q[5], q[10];
