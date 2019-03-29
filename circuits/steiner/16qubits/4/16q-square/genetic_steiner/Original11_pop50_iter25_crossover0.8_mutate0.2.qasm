// Initial wiring: [14, 3, 0, 7, 13, 1, 6, 2, 5, 9, 10, 12, 15, 8, 4, 11]
// Resulting wiring: [14, 3, 0, 7, 13, 1, 6, 2, 5, 9, 10, 12, 15, 8, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[15], q[8];
cx q[10], q[11];
