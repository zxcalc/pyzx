// Initial wiring: [10, 5, 14, 15, 9, 7, 4, 8, 11, 6, 2, 3, 12, 13, 1, 0]
// Resulting wiring: [10, 5, 14, 15, 9, 7, 4, 8, 11, 6, 2, 3, 12, 13, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[3];
cx q[14], q[1];
cx q[0], q[2];
cx q[2], q[11];
