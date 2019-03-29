// Initial wiring: [13, 9, 10, 0, 8, 2, 12, 11, 4, 6, 14, 15, 1, 5, 3, 7]
// Resulting wiring: [13, 9, 10, 0, 8, 2, 12, 11, 4, 6, 14, 15, 1, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[13], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[10];
cx q[10], q[5];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[5];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[9];
cx q[10], q[5];
