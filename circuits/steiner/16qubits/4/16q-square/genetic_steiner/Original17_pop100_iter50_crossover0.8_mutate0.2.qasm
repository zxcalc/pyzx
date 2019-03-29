// Initial wiring: [6, 8, 13, 7, 2, 3, 0, 15, 1, 4, 14, 9, 11, 10, 5, 12]
// Resulting wiring: [6, 8, 13, 7, 2, 3, 0, 15, 1, 4, 14, 9, 11, 10, 5, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[10], q[5];
cx q[12], q[11];
