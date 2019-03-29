// Initial wiring: [2, 9, 11, 7, 5, 10, 13, 15, 6, 4, 14, 0, 3, 1, 12, 8]
// Resulting wiring: [2, 9, 11, 7, 5, 10, 13, 15, 6, 4, 14, 0, 3, 1, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[13], q[10];
cx q[15], q[14];
