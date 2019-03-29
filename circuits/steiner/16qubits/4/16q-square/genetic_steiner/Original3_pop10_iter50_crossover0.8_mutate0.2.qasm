// Initial wiring: [14, 1, 10, 3, 13, 0, 9, 11, 12, 8, 5, 7, 2, 15, 4, 6]
// Resulting wiring: [14, 1, 10, 3, 13, 0, 9, 11, 12, 8, 5, 7, 2, 15, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[8];
cx q[13], q[12];
cx q[10], q[11];
