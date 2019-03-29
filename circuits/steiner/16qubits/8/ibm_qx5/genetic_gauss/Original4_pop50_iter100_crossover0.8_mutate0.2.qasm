// Initial wiring: [9, 2, 3, 1, 0, 13, 10, 6, 4, 14, 7, 15, 12, 8, 5, 11]
// Resulting wiring: [9, 2, 3, 1, 0, 13, 10, 6, 4, 14, 7, 15, 12, 8, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[11], q[6];
cx q[11], q[3];
cx q[13], q[1];
cx q[15], q[4];
cx q[8], q[14];
cx q[1], q[14];
cx q[0], q[1];
