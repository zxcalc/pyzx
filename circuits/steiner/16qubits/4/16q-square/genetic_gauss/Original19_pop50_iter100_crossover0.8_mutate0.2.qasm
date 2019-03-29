// Initial wiring: [1, 12, 7, 9, 4, 5, 6, 13, 14, 10, 0, 3, 11, 8, 15, 2]
// Resulting wiring: [1, 12, 7, 9, 4, 5, 6, 13, 14, 10, 0, 3, 11, 8, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[4];
cx q[14], q[4];
cx q[15], q[4];
cx q[12], q[8];
