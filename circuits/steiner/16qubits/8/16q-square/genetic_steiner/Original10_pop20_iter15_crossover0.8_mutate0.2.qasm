// Initial wiring: [15, 6, 5, 13, 1, 7, 0, 8, 14, 2, 3, 10, 9, 12, 11, 4]
// Resulting wiring: [15, 6, 5, 13, 1, 7, 0, 8, 14, 2, 3, 10, 9, 12, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[14], q[15];
cx q[8], q[15];
cx q[5], q[6];
