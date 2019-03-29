// Initial wiring: [15, 2, 3, 12, 5, 11, 6, 10, 4, 8, 14, 0, 7, 9, 1, 13]
// Resulting wiring: [15, 2, 3, 12, 5, 11, 6, 10, 4, 8, 14, 0, 7, 9, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[13], q[14];
cx q[14], q[15];
cx q[9], q[14];
