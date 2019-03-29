// Initial wiring: [6, 15, 11, 10, 9, 12, 8, 7, 1, 14, 4, 5, 13, 2, 3, 0]
// Resulting wiring: [6, 15, 11, 10, 9, 12, 8, 7, 1, 14, 4, 5, 13, 2, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[5];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[5];
cx q[10], q[9];
cx q[9], q[10];
cx q[6], q[7];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[6], q[5];
