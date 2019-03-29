// Initial wiring: [6, 8, 12, 7, 2, 14, 10, 3, 13, 4, 1, 5, 15, 0, 11, 9]
// Resulting wiring: [6, 8, 12, 7, 2, 14, 10, 3, 13, 4, 1, 5, 15, 0, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[13], q[14];
cx q[12], q[13];
cx q[8], q[9];
cx q[4], q[5];
cx q[1], q[6];
