// Initial wiring: [5, 3, 2, 0, 11, 6, 13, 10, 15, 9, 1, 14, 7, 4, 12, 8]
// Resulting wiring: [5, 3, 2, 0, 11, 6, 13, 10, 15, 9, 1, 14, 7, 4, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[8];
cx q[5], q[10];
cx q[10], q[9];
cx q[3], q[4];
cx q[4], q[11];
