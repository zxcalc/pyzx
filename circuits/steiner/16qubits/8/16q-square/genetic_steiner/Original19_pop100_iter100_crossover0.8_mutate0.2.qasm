// Initial wiring: [0, 15, 2, 3, 8, 1, 11, 7, 9, 12, 14, 4, 10, 6, 13, 5]
// Resulting wiring: [0, 15, 2, 3, 8, 1, 11, 7, 9, 12, 14, 4, 10, 6, 13, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[6], q[5];
cx q[10], q[9];
cx q[11], q[4];
cx q[10], q[11];
cx q[6], q[7];
