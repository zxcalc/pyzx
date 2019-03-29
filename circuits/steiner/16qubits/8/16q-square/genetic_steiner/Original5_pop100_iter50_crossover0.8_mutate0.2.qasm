// Initial wiring: [8, 11, 13, 15, 14, 6, 0, 12, 5, 10, 1, 4, 3, 2, 7, 9]
// Resulting wiring: [8, 11, 13, 15, 14, 6, 0, 12, 5, 10, 1, 4, 3, 2, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[14], q[13];
cx q[13], q[10];
cx q[15], q[8];
cx q[10], q[11];
