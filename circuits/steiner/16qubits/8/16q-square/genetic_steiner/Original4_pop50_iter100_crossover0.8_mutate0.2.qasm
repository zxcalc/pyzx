// Initial wiring: [14, 0, 13, 7, 9, 12, 11, 6, 1, 3, 5, 2, 8, 4, 10, 15]
// Resulting wiring: [14, 0, 13, 7, 9, 12, 11, 6, 1, 3, 5, 2, 8, 4, 10, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[10];
cx q[15], q[14];
cx q[15], q[8];
cx q[4], q[11];
