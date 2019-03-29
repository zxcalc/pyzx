// Initial wiring: [5, 9, 13, 10, 8, 2, 11, 6, 12, 7, 14, 3, 15, 1, 0, 4]
// Resulting wiring: [5, 9, 13, 10, 8, 2, 11, 6, 12, 7, 14, 3, 15, 1, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[0];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[8], q[15];
