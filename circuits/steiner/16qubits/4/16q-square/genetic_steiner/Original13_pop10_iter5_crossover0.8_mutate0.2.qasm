// Initial wiring: [1, 2, 3, 9, 13, 4, 5, 6, 7, 11, 14, 15, 0, 12, 8, 10]
// Resulting wiring: [1, 2, 3, 9, 13, 4, 5, 6, 7, 11, 14, 15, 0, 12, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[13];
cx q[4], q[5];
cx q[1], q[2];
