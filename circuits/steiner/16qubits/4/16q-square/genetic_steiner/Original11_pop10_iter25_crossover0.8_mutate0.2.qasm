// Initial wiring: [12, 6, 4, 9, 13, 3, 0, 10, 2, 1, 8, 7, 11, 5, 15, 14]
// Resulting wiring: [12, 6, 4, 9, 13, 3, 0, 10, 2, 1, 8, 7, 11, 5, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[12], q[13];
cx q[4], q[11];
