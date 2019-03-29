// Initial wiring: [0, 1, 3, 5, 12, 14, 13, 10, 4, 6, 8, 15, 2, 11, 7, 9]
// Resulting wiring: [0, 1, 3, 5, 12, 14, 13, 10, 4, 6, 8, 15, 2, 11, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
cx q[10], q[13];
cx q[6], q[9];
cx q[9], q[8];
