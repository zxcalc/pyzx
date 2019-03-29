// Initial wiring: [14, 15, 1, 10, 12, 9, 8, 7, 4, 5, 2, 0, 13, 11, 3, 6]
// Resulting wiring: [14, 15, 1, 10, 12, 9, 8, 7, 4, 5, 2, 0, 13, 11, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[10], q[5];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[5], q[10];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
