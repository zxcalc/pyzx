// Initial wiring: [5, 3, 13, 9, 2, 8, 1, 15, 14, 6, 10, 0, 7, 11, 12, 4]
// Resulting wiring: [5, 3, 13, 9, 2, 8, 1, 15, 14, 6, 10, 0, 7, 11, 12, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[4];
cx q[7], q[6];
cx q[6], q[1];
cx q[10], q[9];
cx q[14], q[9];
cx q[9], q[8];
cx q[5], q[10];
