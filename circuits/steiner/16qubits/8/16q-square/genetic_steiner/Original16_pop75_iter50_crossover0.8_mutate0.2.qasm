// Initial wiring: [10, 8, 7, 6, 4, 11, 12, 3, 1, 13, 14, 2, 5, 0, 9, 15]
// Resulting wiring: [10, 8, 7, 6, 4, 11, 12, 3, 1, 13, 14, 2, 5, 0, 9, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[11], q[4];
cx q[10], q[13];
cx q[13], q[12];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[5], q[6];
cx q[2], q[3];
cx q[13], q[10];
