// Initial wiring: [10, 3, 14, 4, 1, 5, 7, 6, 8, 13, 2, 11, 0, 9, 12, 15]
// Resulting wiring: [10, 3, 14, 4, 1, 5, 7, 6, 8, 13, 2, 11, 0, 9, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[15], q[14];
cx q[10], q[13];
cx q[8], q[9];
