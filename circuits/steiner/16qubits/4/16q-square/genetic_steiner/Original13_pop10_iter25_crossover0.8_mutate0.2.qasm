// Initial wiring: [9, 10, 1, 5, 6, 0, 13, 7, 11, 4, 15, 8, 2, 3, 14, 12]
// Resulting wiring: [9, 10, 1, 5, 6, 0, 13, 7, 11, 4, 15, 8, 2, 3, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
cx q[12], q[13];
cx q[8], q[9];
cx q[6], q[9];
