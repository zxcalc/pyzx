// Initial wiring: [9, 1, 11, 4, 3, 15, 8, 13, 10, 5, 14, 12, 6, 0, 2, 7]
// Resulting wiring: [9, 1, 11, 4, 3, 15, 8, 13, 10, 5, 14, 12, 6, 0, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[15], q[8];
cx q[10], q[13];
cx q[13], q[12];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[12];
cx q[5], q[6];
cx q[4], q[11];
cx q[11], q[10];
