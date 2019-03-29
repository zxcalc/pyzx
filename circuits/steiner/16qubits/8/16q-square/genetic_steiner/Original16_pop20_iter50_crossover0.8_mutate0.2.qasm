// Initial wiring: [8, 5, 2, 4, 12, 14, 1, 15, 13, 3, 0, 11, 7, 6, 10, 9]
// Resulting wiring: [8, 5, 2, 4, 12, 14, 1, 15, 13, 3, 0, 11, 7, 6, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[11], q[4];
cx q[12], q[13];
cx q[2], q[5];
cx q[2], q[3];
