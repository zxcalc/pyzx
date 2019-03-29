// Initial wiring: [11, 2, 1, 9, 8, 3, 4, 15, 5, 6, 0, 13, 10, 14, 12, 7]
// Resulting wiring: [11, 2, 1, 9, 8, 3, 4, 15, 5, 6, 0, 13, 10, 14, 12, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[7], q[0];
cx q[10], q[5];
cx q[5], q[2];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[12], q[11];
cx q[10], q[13];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
