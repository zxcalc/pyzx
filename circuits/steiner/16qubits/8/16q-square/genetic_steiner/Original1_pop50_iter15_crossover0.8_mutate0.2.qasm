// Initial wiring: [9, 7, 0, 8, 5, 3, 14, 13, 12, 1, 4, 15, 6, 11, 2, 10]
// Resulting wiring: [9, 7, 0, 8, 5, 3, 14, 13, 12, 1, 4, 15, 6, 11, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[13], q[12];
cx q[14], q[9];
cx q[6], q[9];
cx q[9], q[8];
