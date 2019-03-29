// Initial wiring: [3, 7, 0, 12, 1, 14, 9, 15, 11, 8, 10, 5, 4, 6, 13, 2]
// Resulting wiring: [3, 7, 0, 12, 1, 14, 9, 15, 11, 8, 10, 5, 4, 6, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[14], q[13];
cx q[13], q[12];
cx q[1], q[6];
