// Initial wiring: [0, 8, 1, 9, 4, 6, 13, 7, 3, 11, 2, 10, 12, 15, 14, 5]
// Resulting wiring: [0, 8, 1, 9, 4, 6, 13, 7, 3, 11, 2, 10, 12, 15, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[5];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[6], q[7];
cx q[4], q[5];
