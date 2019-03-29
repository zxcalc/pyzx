// Initial wiring: [1, 10, 7, 3, 9, 11, 15, 8, 4, 14, 12, 5, 0, 6, 2, 13]
// Resulting wiring: [1, 10, 7, 3, 9, 11, 15, 8, 4, 14, 12, 5, 0, 6, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[2];
cx q[9], q[10];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[0], q[7];
