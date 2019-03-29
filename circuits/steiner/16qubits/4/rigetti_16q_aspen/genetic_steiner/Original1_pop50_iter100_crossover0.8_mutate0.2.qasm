// Initial wiring: [15, 0, 9, 4, 12, 10, 11, 2, 6, 8, 1, 5, 7, 3, 13, 14]
// Resulting wiring: [15, 0, 9, 4, 12, 10, 11, 2, 6, 8, 1, 5, 7, 3, 13, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[12], q[11];
cx q[14], q[15];
cx q[12], q[13];
