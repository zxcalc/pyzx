// Initial wiring: [15, 0, 4, 14, 13, 6, 1, 9, 5, 11, 2, 8, 12, 7, 3, 10]
// Resulting wiring: [15, 0, 4, 14, 13, 6, 1, 9, 5, 11, 2, 8, 12, 7, 3, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[13];
cx q[9], q[10];
cx q[10], q[11];
cx q[4], q[5];
