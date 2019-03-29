// Initial wiring: [1, 7, 10, 8, 12, 9, 13, 3, 11, 2, 14, 0, 5, 6, 4, 15]
// Resulting wiring: [1, 7, 10, 8, 12, 9, 13, 3, 11, 2, 14, 0, 5, 6, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[4];
cx q[15], q[3];
cx q[12], q[10];
cx q[12], q[11];
cx q[9], q[11];
cx q[10], q[13];
cx q[1], q[2];
cx q[4], q[10];
