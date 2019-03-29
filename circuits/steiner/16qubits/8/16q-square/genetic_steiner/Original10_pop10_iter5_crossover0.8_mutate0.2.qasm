// Initial wiring: [1, 12, 7, 15, 6, 0, 2, 13, 10, 14, 3, 5, 11, 4, 8, 9]
// Resulting wiring: [1, 12, 7, 15, 6, 0, 2, 13, 10, 14, 3, 5, 11, 4, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[11], q[10];
cx q[4], q[3];
cx q[12], q[11];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[10];
cx q[12], q[13];
cx q[10], q[13];
cx q[9], q[10];
cx q[10], q[13];
cx q[13], q[10];
cx q[2], q[5];
cx q[1], q[6];
