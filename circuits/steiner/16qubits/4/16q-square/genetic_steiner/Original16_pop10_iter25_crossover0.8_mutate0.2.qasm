// Initial wiring: [5, 11, 13, 12, 10, 8, 2, 4, 9, 1, 0, 6, 7, 15, 3, 14]
// Resulting wiring: [5, 11, 13, 12, 10, 8, 2, 4, 9, 1, 0, 6, 7, 15, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[6];
cx q[12], q[11];
cx q[14], q[13];
