// Initial wiring: [10, 12, 2, 1, 5, 14, 15, 8, 6, 11, 7, 9, 0, 4, 13, 3]
// Resulting wiring: [10, 12, 2, 1, 5, 14, 15, 8, 6, 11, 7, 9, 0, 4, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[11], q[4];
cx q[14], q[15];
cx q[9], q[10];
