// Initial wiring: [8, 6, 3, 2, 10, 7, 11, 12, 1, 9, 5, 15, 14, 0, 4, 13]
// Resulting wiring: [8, 6, 3, 2, 10, 7, 11, 12, 1, 9, 5, 15, 14, 0, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[5];
cx q[5], q[4];
cx q[3], q[4];
cx q[1], q[6];
cx q[0], q[7];
