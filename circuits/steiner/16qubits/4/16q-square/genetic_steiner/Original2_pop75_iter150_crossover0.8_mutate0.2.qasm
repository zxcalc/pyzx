// Initial wiring: [14, 6, 4, 2, 15, 9, 13, 0, 3, 11, 7, 1, 5, 12, 8, 10]
// Resulting wiring: [14, 6, 4, 2, 15, 9, 13, 0, 3, 11, 7, 1, 5, 12, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[14], q[9];
cx q[1], q[2];
