// Initial wiring: [2, 8, 0, 3, 14, 5, 11, 15, 10, 7, 9, 12, 13, 4, 6, 1]
// Resulting wiring: [2, 8, 0, 3, 14, 5, 11, 15, 10, 7, 9, 12, 13, 4, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[14];
cx q[12], q[13];
cx q[13], q[14];
cx q[9], q[10];
cx q[1], q[6];
