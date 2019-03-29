// Initial wiring: [0, 11, 13, 3, 14, 9, 2, 12, 4, 15, 6, 10, 8, 7, 1, 5]
// Resulting wiring: [0, 11, 13, 3, 14, 9, 2, 12, 4, 15, 6, 10, 8, 7, 1, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[10], q[5];
cx q[12], q[3];
cx q[13], q[2];
cx q[14], q[1];
cx q[1], q[0];
cx q[15], q[0];
cx q[4], q[5];
