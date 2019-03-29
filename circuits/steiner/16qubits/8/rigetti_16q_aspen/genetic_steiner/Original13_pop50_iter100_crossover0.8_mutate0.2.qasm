// Initial wiring: [1, 2, 10, 7, 5, 8, 6, 11, 9, 13, 12, 4, 15, 3, 14, 0]
// Resulting wiring: [1, 2, 10, 7, 5, 8, 6, 11, 9, 13, 12, 4, 15, 3, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[15], q[8];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[11];
cx q[8], q[9];
cx q[9], q[10];
cx q[7], q[8];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[9];
