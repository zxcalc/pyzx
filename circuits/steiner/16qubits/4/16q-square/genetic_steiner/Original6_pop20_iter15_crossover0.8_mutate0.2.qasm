// Initial wiring: [9, 2, 15, 0, 4, 12, 6, 8, 1, 3, 5, 13, 7, 11, 10, 14]
// Resulting wiring: [9, 2, 15, 0, 4, 12, 6, 8, 1, 3, 5, 13, 7, 11, 10, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[13], q[14];
cx q[14], q[15];
cx q[10], q[13];
