// Initial wiring: [15, 3, 0, 9, 12, 14, 11, 13, 2, 1, 10, 5, 7, 6, 8, 4]
// Resulting wiring: [15, 3, 0, 9, 12, 14, 11, 13, 2, 1, 10, 5, 7, 6, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[9], q[8];
cx q[12], q[13];
