// Initial wiring: [6, 15, 10, 14, 3, 12, 7, 0, 11, 8, 9, 5, 1, 2, 4, 13]
// Resulting wiring: [6, 15, 10, 14, 3, 12, 7, 0, 11, 8, 9, 5, 1, 2, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[14], q[1];
cx q[2], q[3];
cx q[3], q[4];
