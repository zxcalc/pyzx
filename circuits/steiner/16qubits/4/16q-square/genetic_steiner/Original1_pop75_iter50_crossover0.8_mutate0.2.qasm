// Initial wiring: [2, 9, 11, 12, 14, 4, 10, 8, 0, 6, 3, 13, 15, 7, 5, 1]
// Resulting wiring: [2, 9, 11, 12, 14, 4, 10, 8, 0, 6, 3, 13, 15, 7, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[13], q[10];
cx q[14], q[15];
cx q[13], q[14];
