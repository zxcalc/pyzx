// Initial wiring: [15, 4, 0, 3, 8, 12, 5, 11, 2, 7, 10, 6, 1, 13, 14, 9]
// Resulting wiring: [15, 4, 0, 3, 8, 12, 5, 11, 2, 7, 10, 6, 1, 13, 14, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[9];
cx q[10], q[5];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[2], q[3];
