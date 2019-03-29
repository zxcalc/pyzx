// Initial wiring: [2, 10, 15, 11, 5, 6, 1, 13, 0, 14, 7, 3, 8, 4, 12, 9]
// Resulting wiring: [2, 10, 15, 11, 5, 6, 1, 13, 0, 14, 7, 3, 8, 4, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[14];
cx q[14], q[13];
cx q[0], q[7];
