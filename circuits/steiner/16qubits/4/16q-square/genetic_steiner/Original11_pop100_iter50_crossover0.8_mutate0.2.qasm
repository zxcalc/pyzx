// Initial wiring: [3, 5, 7, 13, 1, 4, 11, 0, 14, 12, 2, 9, 8, 15, 10, 6]
// Resulting wiring: [3, 5, 7, 13, 1, 4, 11, 0, 14, 12, 2, 9, 8, 15, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[1];
cx q[7], q[0];
cx q[14], q[9];
