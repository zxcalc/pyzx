// Initial wiring: [14, 10, 11, 9, 3, 15, 0, 12, 4, 1, 6, 5, 13, 2, 7, 8]
// Resulting wiring: [14, 10, 11, 9, 3, 15, 0, 12, 4, 1, 6, 5, 13, 2, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[10], q[11];
cx q[0], q[7];
cx q[7], q[8];
