// Initial wiring: [13, 15, 12, 2, 9, 10, 3, 4, 11, 6, 1, 0, 14, 7, 8, 5]
// Resulting wiring: [13, 15, 12, 2, 9, 10, 3, 4, 11, 6, 1, 0, 14, 7, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[13];
cx q[7], q[8];
cx q[6], q[9];
cx q[1], q[2];
cx q[2], q[3];
