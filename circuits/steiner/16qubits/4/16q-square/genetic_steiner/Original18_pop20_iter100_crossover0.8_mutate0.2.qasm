// Initial wiring: [14, 0, 4, 11, 5, 1, 3, 7, 9, 12, 8, 13, 6, 10, 15, 2]
// Resulting wiring: [14, 0, 4, 11, 5, 1, 3, 7, 9, 12, 8, 13, 6, 10, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[14], q[9];
cx q[15], q[8];
cx q[10], q[11];
