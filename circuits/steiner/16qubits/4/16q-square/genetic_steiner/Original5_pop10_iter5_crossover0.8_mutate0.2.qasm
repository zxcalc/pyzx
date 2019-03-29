// Initial wiring: [9, 8, 15, 5, 6, 13, 10, 14, 1, 11, 7, 2, 4, 12, 3, 0]
// Resulting wiring: [9, 8, 15, 5, 6, 13, 10, 14, 1, 11, 7, 2, 4, 12, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[13];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[4];
