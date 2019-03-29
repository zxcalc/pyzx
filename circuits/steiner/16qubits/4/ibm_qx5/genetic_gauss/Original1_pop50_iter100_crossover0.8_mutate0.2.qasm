// Initial wiring: [7, 3, 6, 0, 2, 12, 9, 13, 15, 11, 4, 14, 10, 5, 8, 1]
// Resulting wiring: [7, 3, 6, 0, 2, 12, 9, 13, 15, 11, 4, 14, 10, 5, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[15];
cx q[7], q[11];
cx q[0], q[1];
cx q[0], q[13];
