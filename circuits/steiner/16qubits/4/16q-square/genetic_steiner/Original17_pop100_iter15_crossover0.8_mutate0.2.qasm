// Initial wiring: [13, 12, 9, 11, 8, 1, 4, 15, 7, 10, 2, 6, 0, 3, 14, 5]
// Resulting wiring: [13, 12, 9, 11, 8, 1, 4, 15, 7, 10, 2, 6, 0, 3, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[14], q[13];
cx q[12], q[13];
