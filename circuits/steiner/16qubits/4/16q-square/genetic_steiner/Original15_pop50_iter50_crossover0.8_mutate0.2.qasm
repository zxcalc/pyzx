// Initial wiring: [1, 10, 15, 3, 13, 2, 8, 7, 0, 9, 11, 5, 6, 4, 12, 14]
// Resulting wiring: [1, 10, 15, 3, 13, 2, 8, 7, 0, 9, 11, 5, 6, 4, 12, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[13];
