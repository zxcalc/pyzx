// Initial wiring: [5, 4, 14, 7, 12, 6, 11, 8, 2, 9, 13, 0, 1, 10, 15, 3]
// Resulting wiring: [5, 4, 14, 7, 12, 6, 11, 8, 2, 9, 13, 0, 1, 10, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[10], q[5];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
