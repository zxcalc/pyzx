// Initial wiring: [5, 15, 13, 4, 1, 8, 0, 3, 14, 11, 6, 12, 10, 7, 9, 2]
// Resulting wiring: [5, 15, 13, 4, 1, 8, 0, 3, 14, 11, 6, 12, 10, 7, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[14];
cx q[6], q[7];
cx q[3], q[4];
