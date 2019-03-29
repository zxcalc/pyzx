// Initial wiring: [14, 6, 11, 13, 4, 9, 8, 12, 15, 10, 0, 1, 2, 5, 3, 7]
// Resulting wiring: [14, 6, 11, 13, 4, 9, 8, 12, 15, 10, 0, 1, 2, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[3], q[4];
cx q[2], q[5];
cx q[5], q[6];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[5];
cx q[2], q[3];
