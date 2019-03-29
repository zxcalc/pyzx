// Initial wiring: [1, 0, 12, 2, 4, 5, 14, 8, 13, 7, 10, 15, 3, 6, 9, 11]
// Resulting wiring: [1, 0, 12, 2, 4, 5, 14, 8, 13, 7, 10, 15, 3, 6, 9, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[6], q[0];
cx q[15], q[13];
cx q[8], q[14];
cx q[6], q[12];
cx q[2], q[14];
cx q[0], q[2];
cx q[1], q[9];
