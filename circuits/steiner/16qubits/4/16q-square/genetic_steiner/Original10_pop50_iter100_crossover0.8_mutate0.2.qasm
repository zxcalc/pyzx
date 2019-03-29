// Initial wiring: [7, 5, 2, 3, 13, 1, 9, 11, 0, 12, 8, 4, 14, 6, 15, 10]
// Resulting wiring: [7, 5, 2, 3, 13, 1, 9, 11, 0, 12, 8, 4, 14, 6, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[10], q[11];
