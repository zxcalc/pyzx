// Initial wiring: [4, 12, 10, 14, 5, 11, 2, 6, 9, 7, 8, 3, 0, 15, 1, 13]
// Resulting wiring: [4, 12, 10, 14, 5, 11, 2, 6, 9, 7, 8, 3, 0, 15, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[5];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[0];
cx q[15], q[8];
