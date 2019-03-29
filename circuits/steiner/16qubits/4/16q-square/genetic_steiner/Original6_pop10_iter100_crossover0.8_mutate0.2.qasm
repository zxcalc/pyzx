// Initial wiring: [12, 13, 4, 11, 10, 5, 8, 3, 6, 9, 7, 14, 15, 0, 1, 2]
// Resulting wiring: [12, 13, 4, 11, 10, 5, 8, 3, 6, 9, 7, 14, 15, 0, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[4];
cx q[4], q[11];
cx q[1], q[2];
