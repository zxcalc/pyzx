// Initial wiring: [4, 10, 6, 7, 8, 11, 5, 1, 15, 2, 9, 12, 14, 3, 0, 13]
// Resulting wiring: [4, 10, 6, 7, 8, 11, 5, 1, 15, 2, 9, 12, 14, 3, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[12], q[13];
cx q[5], q[10];
cx q[0], q[7];
