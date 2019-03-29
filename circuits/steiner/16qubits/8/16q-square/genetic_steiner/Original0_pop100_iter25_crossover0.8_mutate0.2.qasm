// Initial wiring: [4, 13, 1, 7, 10, 6, 9, 11, 15, 2, 0, 3, 12, 14, 5, 8]
// Resulting wiring: [4, 13, 1, 7, 10, 6, 9, 11, 15, 2, 0, 3, 12, 14, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[10];
cx q[10], q[5];
cx q[11], q[12];
cx q[12], q[13];
cx q[9], q[10];
cx q[8], q[15];
cx q[3], q[4];
