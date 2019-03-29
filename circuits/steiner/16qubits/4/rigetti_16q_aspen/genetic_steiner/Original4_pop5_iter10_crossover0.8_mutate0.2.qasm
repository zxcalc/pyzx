// Initial wiring: [10, 6, 2, 15, 14, 13, 3, 1, 7, 0, 11, 12, 4, 8, 5, 9]
// Resulting wiring: [10, 6, 2, 15, 14, 13, 3, 1, 7, 0, 11, 12, 4, 8, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[15], q[14];
cx q[5], q[6];
cx q[3], q[4];
