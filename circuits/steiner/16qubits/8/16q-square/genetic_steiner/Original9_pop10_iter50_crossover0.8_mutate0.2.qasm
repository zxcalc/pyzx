// Initial wiring: [6, 14, 7, 4, 5, 3, 9, 12, 10, 0, 15, 1, 11, 13, 2, 8]
// Resulting wiring: [6, 14, 7, 4, 5, 3, 9, 12, 10, 0, 15, 1, 11, 13, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[15], q[14];
cx q[15], q[8];
cx q[10], q[11];
cx q[0], q[1];
