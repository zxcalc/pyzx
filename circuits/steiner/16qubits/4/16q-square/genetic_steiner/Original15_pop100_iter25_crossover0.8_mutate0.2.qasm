// Initial wiring: [10, 6, 5, 3, 1, 8, 15, 11, 0, 9, 2, 13, 7, 4, 12, 14]
// Resulting wiring: [10, 6, 5, 3, 1, 8, 15, 11, 0, 9, 2, 13, 7, 4, 12, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[14], q[13];
cx q[10], q[11];
cx q[1], q[2];
