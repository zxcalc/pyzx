// Initial wiring: [7, 3, 13, 10, 8, 14, 0, 5, 2, 1, 6, 12, 11, 15, 4, 9]
// Resulting wiring: [7, 3, 13, 10, 8, 14, 0, 5, 2, 1, 6, 12, 11, 15, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[5];
cx q[9], q[8];
cx q[13], q[12];
cx q[14], q[13];
cx q[6], q[9];
cx q[1], q[14];
cx q[14], q[13];
