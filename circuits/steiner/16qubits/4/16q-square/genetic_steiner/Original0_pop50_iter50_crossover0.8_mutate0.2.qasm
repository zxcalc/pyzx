// Initial wiring: [12, 13, 6, 11, 5, 1, 2, 3, 14, 10, 8, 0, 7, 15, 4, 9]
// Resulting wiring: [12, 13, 6, 11, 5, 1, 2, 3, 14, 10, 8, 0, 7, 15, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[8];
cx q[8], q[7];
cx q[14], q[13];
