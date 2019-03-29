// Initial wiring: [9, 1, 11, 4, 14, 2, 12, 5, 6, 15, 0, 3, 8, 7, 10, 13]
// Resulting wiring: [9, 1, 11, 4, 14, 2, 12, 5, 6, 15, 0, 3, 8, 7, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[9], q[8];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[13], q[10];
cx q[7], q[8];
cx q[8], q[9];
cx q[2], q[3];
