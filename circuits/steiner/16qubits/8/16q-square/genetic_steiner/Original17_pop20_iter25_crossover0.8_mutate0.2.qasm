// Initial wiring: [8, 15, 12, 3, 9, 1, 6, 4, 13, 2, 0, 7, 14, 11, 10, 5]
// Resulting wiring: [8, 15, 12, 3, 9, 1, 6, 4, 13, 2, 0, 7, 14, 11, 10, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[10], q[13];
cx q[13], q[12];
cx q[1], q[2];
cx q[0], q[1];
cx q[0], q[7];
cx q[1], q[2];
