// Initial wiring: [0, 9, 3, 14, 7, 2, 13, 5, 10, 1, 8, 4, 12, 15, 6, 11]
// Resulting wiring: [0, 9, 3, 14, 7, 2, 13, 5, 10, 1, 8, 4, 12, 15, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[10], q[9];
cx q[10], q[11];
cx q[6], q[9];
cx q[1], q[6];
cx q[6], q[9];
