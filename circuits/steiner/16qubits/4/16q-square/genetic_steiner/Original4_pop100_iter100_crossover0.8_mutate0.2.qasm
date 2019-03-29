// Initial wiring: [8, 1, 14, 10, 12, 15, 4, 7, 11, 0, 6, 2, 13, 3, 9, 5]
// Resulting wiring: [8, 1, 14, 10, 12, 15, 4, 7, 11, 0, 6, 2, 13, 3, 9, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[8], q[7];
cx q[14], q[15];
cx q[12], q[13];
