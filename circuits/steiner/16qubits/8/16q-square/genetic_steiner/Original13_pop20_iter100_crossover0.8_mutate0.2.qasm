// Initial wiring: [14, 3, 0, 15, 4, 12, 7, 2, 1, 10, 9, 13, 11, 8, 6, 5]
// Resulting wiring: [14, 3, 0, 15, 4, 12, 7, 2, 1, 10, 9, 13, 11, 8, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[5], q[10];
cx q[2], q[5];
cx q[5], q[10];
