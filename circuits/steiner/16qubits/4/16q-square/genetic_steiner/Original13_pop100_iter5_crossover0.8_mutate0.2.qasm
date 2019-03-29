// Initial wiring: [5, 1, 7, 12, 14, 6, 0, 4, 11, 13, 10, 15, 9, 8, 3, 2]
// Resulting wiring: [5, 1, 7, 12, 14, 6, 0, 4, 11, 13, 10, 15, 9, 8, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[15], q[14];
