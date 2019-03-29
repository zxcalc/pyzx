// Initial wiring: [8, 4, 5, 13, 12, 14, 2, 1, 15, 10, 0, 11, 7, 6, 3, 9]
// Resulting wiring: [8, 4, 5, 13, 12, 14, 2, 1, 15, 10, 0, 11, 7, 6, 3, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[6], q[1];
cx q[10], q[5];
cx q[5], q[2];
cx q[12], q[11];
cx q[11], q[10];
cx q[11], q[4];
cx q[12], q[13];
