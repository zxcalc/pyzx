// Initial wiring: [10, 1, 0, 7, 14, 5, 15, 9, 2, 12, 13, 4, 11, 3, 6, 8]
// Resulting wiring: [10, 1, 0, 7, 14, 5, 15, 9, 2, 12, 13, 4, 11, 3, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[4], q[3];
cx q[13], q[14];
cx q[11], q[12];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[8];
