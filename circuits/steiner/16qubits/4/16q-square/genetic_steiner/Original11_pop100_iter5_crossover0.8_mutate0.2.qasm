// Initial wiring: [4, 6, 15, 14, 7, 1, 12, 0, 3, 10, 2, 13, 8, 5, 11, 9]
// Resulting wiring: [4, 6, 15, 14, 7, 1, 12, 0, 3, 10, 2, 13, 8, 5, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[11], q[4];
cx q[14], q[13];
cx q[7], q[8];
