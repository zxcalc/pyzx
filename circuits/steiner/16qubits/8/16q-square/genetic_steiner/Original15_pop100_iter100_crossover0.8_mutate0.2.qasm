// Initial wiring: [5, 9, 2, 7, 11, 14, 13, 3, 1, 4, 12, 0, 15, 8, 10, 6]
// Resulting wiring: [5, 9, 2, 7, 11, 14, 13, 3, 1, 4, 12, 0, 15, 8, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[12], q[11];
cx q[13], q[14];
cx q[8], q[9];
cx q[6], q[9];
cx q[6], q[7];
cx q[2], q[5];
cx q[2], q[3];
