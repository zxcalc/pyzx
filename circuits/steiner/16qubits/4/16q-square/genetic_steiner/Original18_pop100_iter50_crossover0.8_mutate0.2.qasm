// Initial wiring: [11, 4, 8, 10, 7, 13, 14, 0, 1, 3, 2, 5, 6, 9, 12, 15]
// Resulting wiring: [11, 4, 8, 10, 7, 13, 14, 0, 1, 3, 2, 5, 6, 9, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[15], q[14];
cx q[10], q[13];
cx q[2], q[5];
