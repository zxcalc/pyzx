// Initial wiring: [10, 7, 2, 13, 5, 3, 15, 4, 11, 14, 8, 6, 12, 9, 0, 1]
// Resulting wiring: [10, 7, 2, 13, 5, 3, 15, 4, 11, 14, 8, 6, 12, 9, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[8];
cx q[15], q[8];
cx q[6], q[7];
