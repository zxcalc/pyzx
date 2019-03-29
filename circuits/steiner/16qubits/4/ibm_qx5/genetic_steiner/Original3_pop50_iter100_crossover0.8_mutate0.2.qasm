// Initial wiring: [6, 2, 4, 0, 11, 5, 14, 1, 9, 13, 7, 3, 8, 12, 15, 10]
// Resulting wiring: [6, 2, 4, 0, 11, 5, 14, 1, 9, 13, 7, 3, 8, 12, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[14], q[1];
cx q[12], q[13];
cx q[5], q[10];
