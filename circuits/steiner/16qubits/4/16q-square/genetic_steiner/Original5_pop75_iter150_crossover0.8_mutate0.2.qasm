// Initial wiring: [7, 6, 2, 4, 1, 11, 5, 0, 10, 13, 8, 14, 15, 12, 3, 9]
// Resulting wiring: [7, 6, 2, 4, 1, 11, 5, 0, 10, 13, 8, 14, 15, 12, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[14], q[13];
cx q[6], q[9];
cx q[5], q[10];
