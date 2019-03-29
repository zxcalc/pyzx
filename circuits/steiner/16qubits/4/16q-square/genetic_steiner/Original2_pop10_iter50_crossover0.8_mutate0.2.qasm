// Initial wiring: [1, 0, 5, 2, 11, 4, 6, 3, 10, 13, 12, 8, 7, 9, 15, 14]
// Resulting wiring: [1, 0, 5, 2, 11, 4, 6, 3, 10, 13, 12, 8, 7, 9, 15, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[11], q[4];
cx q[12], q[13];
