// Initial wiring: [5, 13, 11, 7, 3, 8, 1, 0, 2, 6, 4, 15, 14, 10, 12, 9]
// Resulting wiring: [5, 13, 11, 7, 3, 8, 1, 0, 2, 6, 4, 15, 14, 10, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[7];
cx q[8], q[0];
cx q[7], q[1];
cx q[13], q[2];
cx q[14], q[11];
cx q[5], q[8];
cx q[2], q[8];
cx q[4], q[10];
