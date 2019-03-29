// Initial wiring: [8, 12, 3, 10, 6, 14, 11, 7, 5, 4, 1, 0, 9, 13, 15, 2]
// Resulting wiring: [8, 12, 3, 10, 6, 14, 11, 7, 5, 4, 1, 0, 9, 13, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[5];
cx q[14], q[15];
cx q[0], q[1];
