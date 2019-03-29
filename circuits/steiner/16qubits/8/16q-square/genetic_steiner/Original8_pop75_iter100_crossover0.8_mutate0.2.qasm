// Initial wiring: [8, 3, 13, 9, 2, 6, 10, 14, 0, 5, 1, 11, 12, 7, 15, 4]
// Resulting wiring: [8, 3, 13, 9, 2, 6, 10, 14, 0, 5, 1, 11, 12, 7, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[6], q[5];
cx q[6], q[1];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[12];
cx q[4], q[5];
