// Initial wiring: [13, 4, 10, 1, 11, 0, 5, 7, 2, 9, 14, 12, 8, 3, 6, 15]
// Resulting wiring: [13, 4, 10, 1, 11, 0, 5, 7, 2, 9, 14, 12, 8, 3, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[0];
cx q[10], q[9];
cx q[14], q[9];
cx q[12], q[13];
cx q[8], q[9];
cx q[3], q[4];
cx q[4], q[5];
