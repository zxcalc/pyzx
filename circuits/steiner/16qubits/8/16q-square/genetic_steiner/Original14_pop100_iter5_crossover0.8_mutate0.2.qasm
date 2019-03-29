// Initial wiring: [14, 0, 10, 4, 15, 2, 7, 11, 6, 3, 8, 12, 5, 13, 1, 9]
// Resulting wiring: [14, 0, 10, 4, 15, 2, 7, 11, 6, 3, 8, 12, 5, 13, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[8], q[7];
cx q[10], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[10], q[9];
