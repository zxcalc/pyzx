// Initial wiring: [12, 5, 2, 14, 7, 13, 9, 8, 3, 11, 6, 4, 1, 15, 10, 0]
// Resulting wiring: [12, 5, 2, 14, 7, 13, 9, 8, 3, 11, 6, 4, 1, 15, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[5], q[2];
cx q[10], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[10];
cx q[5], q[6];
