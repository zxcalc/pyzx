// Initial wiring: [13, 0, 4, 3, 14, 7, 5, 10, 11, 2, 15, 12, 6, 1, 8, 9]
// Resulting wiring: [13, 0, 4, 3, 14, 7, 5, 10, 11, 2, 15, 12, 6, 1, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[3], q[2];
cx q[9], q[6];
cx q[11], q[10];
cx q[14], q[9];
cx q[7], q[8];
cx q[8], q[9];
