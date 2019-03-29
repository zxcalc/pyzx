// Initial wiring: [6, 5, 14, 2, 15, 8, 11, 0, 9, 13, 7, 10, 4, 3, 1, 12]
// Resulting wiring: [6, 5, 14, 2, 15, 8, 11, 0, 9, 13, 7, 10, 4, 3, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[14];
cx q[0], q[7];
