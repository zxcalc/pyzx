// Initial wiring: [12, 8, 10, 0, 7, 6, 5, 9, 4, 3, 1, 2, 13, 11, 15, 14]
// Resulting wiring: [12, 8, 10, 0, 7, 6, 5, 9, 4, 3, 1, 2, 13, 11, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[13];
cx q[10], q[11];
cx q[9], q[14];
cx q[4], q[5];
