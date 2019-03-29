// Initial wiring: [0, 8, 5, 9, 7, 3, 11, 2, 1, 14, 4, 13, 10, 6, 12, 15]
// Resulting wiring: [0, 8, 5, 9, 7, 3, 11, 2, 1, 14, 4, 13, 10, 6, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[12], q[13];
cx q[10], q[13];
