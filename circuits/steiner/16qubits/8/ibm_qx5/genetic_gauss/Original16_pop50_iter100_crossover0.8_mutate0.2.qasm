// Initial wiring: [6, 11, 14, 8, 9, 13, 4, 1, 15, 3, 12, 2, 7, 0, 5, 10]
// Resulting wiring: [6, 11, 14, 8, 9, 13, 4, 1, 15, 3, 12, 2, 7, 0, 5, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[6];
cx q[11], q[2];
cx q[12], q[0];
cx q[12], q[1];
cx q[13], q[2];
cx q[2], q[14];
cx q[1], q[13];
cx q[1], q[10];
