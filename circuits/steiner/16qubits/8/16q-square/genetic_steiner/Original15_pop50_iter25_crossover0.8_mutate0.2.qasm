// Initial wiring: [6, 11, 0, 9, 14, 15, 5, 12, 10, 1, 3, 2, 7, 13, 4, 8]
// Resulting wiring: [6, 11, 0, 9, 14, 15, 5, 12, 10, 1, 3, 2, 7, 13, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[11], q[4];
cx q[13], q[10];
cx q[15], q[8];
cx q[13], q[14];
cx q[11], q[12];
cx q[9], q[14];
