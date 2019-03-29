// Initial wiring: [13, 7, 14, 8, 0, 15, 12, 2, 9, 5, 10, 1, 4, 11, 6, 3]
// Resulting wiring: [13, 7, 14, 8, 0, 15, 12, 2, 9, 5, 10, 1, 4, 11, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[11], q[10];
cx q[15], q[14];
cx q[12], q[13];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[11];
