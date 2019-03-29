// Initial wiring: [3, 14, 0, 12, 1, 15, 11, 9, 6, 2, 4, 13, 7, 5, 10, 8]
// Resulting wiring: [3, 14, 0, 12, 1, 15, 11, 9, 6, 2, 4, 13, 7, 5, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[10];
cx q[9], q[10];
cx q[5], q[10];
