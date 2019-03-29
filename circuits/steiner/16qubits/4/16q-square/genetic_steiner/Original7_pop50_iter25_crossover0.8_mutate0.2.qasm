// Initial wiring: [2, 15, 12, 7, 10, 8, 14, 0, 3, 4, 11, 9, 6, 1, 5, 13]
// Resulting wiring: [2, 15, 12, 7, 10, 8, 14, 0, 3, 4, 11, 9, 6, 1, 5, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[9], q[10];
cx q[10], q[11];
cx q[1], q[2];
