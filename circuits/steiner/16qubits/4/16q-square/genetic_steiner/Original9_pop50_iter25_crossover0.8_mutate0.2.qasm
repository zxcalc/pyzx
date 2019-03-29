// Initial wiring: [15, 0, 7, 12, 3, 9, 10, 14, 6, 13, 4, 1, 5, 8, 2, 11]
// Resulting wiring: [15, 0, 7, 12, 3, 9, 10, 14, 6, 13, 4, 1, 5, 8, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[13];
