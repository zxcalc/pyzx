// Initial wiring: [11, 4, 15, 8, 3, 12, 10, 7, 1, 2, 0, 9, 6, 14, 5, 13]
// Resulting wiring: [11, 4, 15, 8, 3, 12, 10, 7, 1, 2, 0, 9, 6, 14, 5, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[12];
cx q[9], q[10];
cx q[10], q[13];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[13], q[10];
cx q[2], q[3];
