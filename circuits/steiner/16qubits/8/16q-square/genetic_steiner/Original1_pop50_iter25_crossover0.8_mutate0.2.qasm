// Initial wiring: [10, 6, 11, 8, 3, 14, 1, 2, 9, 12, 0, 7, 4, 5, 15, 13]
// Resulting wiring: [10, 6, 11, 8, 3, 14, 1, 2, 9, 12, 0, 7, 4, 5, 15, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[7], q[6];
cx q[9], q[8];
cx q[15], q[8];
cx q[10], q[11];
cx q[5], q[6];
cx q[6], q[9];
