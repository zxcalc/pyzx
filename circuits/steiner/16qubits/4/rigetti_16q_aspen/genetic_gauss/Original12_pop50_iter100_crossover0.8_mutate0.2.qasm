// Initial wiring: [13, 12, 4, 0, 5, 6, 8, 10, 2, 15, 3, 1, 9, 14, 7, 11]
// Resulting wiring: [13, 12, 4, 0, 5, 6, 8, 10, 2, 15, 3, 1, 9, 14, 7, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[8];
cx q[9], q[2];
cx q[13], q[15];
cx q[11], q[15];
