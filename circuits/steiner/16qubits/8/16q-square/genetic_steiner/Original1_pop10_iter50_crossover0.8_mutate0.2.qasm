// Initial wiring: [9, 5, 4, 10, 2, 1, 12, 13, 7, 0, 14, 3, 15, 8, 11, 6]
// Resulting wiring: [9, 5, 4, 10, 2, 1, 12, 13, 7, 0, 14, 3, 15, 8, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[7], q[0];
cx q[9], q[8];
cx q[10], q[5];
cx q[14], q[15];
cx q[10], q[11];
cx q[4], q[5];
cx q[5], q[6];
