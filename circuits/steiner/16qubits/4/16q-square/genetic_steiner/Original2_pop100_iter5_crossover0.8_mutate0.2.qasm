// Initial wiring: [11, 10, 14, 4, 1, 6, 12, 8, 5, 3, 13, 9, 7, 2, 0, 15]
// Resulting wiring: [11, 10, 14, 4, 1, 6, 12, 8, 5, 3, 13, 9, 7, 2, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[10], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[12], q[11];
