// Initial wiring: [15, 4, 2, 9, 6, 5, 13, 1, 3, 7, 10, 8, 11, 14, 0, 12]
// Resulting wiring: [15, 4, 2, 9, 6, 5, 13, 1, 3, 7, 10, 8, 11, 14, 0, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[12], q[13];
cx q[0], q[1];
