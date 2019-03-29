// Initial wiring: [3, 15, 14, 2, 6, 9, 1, 0, 7, 12, 13, 8, 11, 4, 10, 5]
// Resulting wiring: [3, 15, 14, 2, 6, 9, 1, 0, 7, 12, 13, 8, 11, 4, 10, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[10], q[9];
cx q[11], q[4];
cx q[11], q[12];
cx q[10], q[13];
cx q[5], q[10];
cx q[10], q[9];
cx q[4], q[11];
cx q[4], q[5];
cx q[11], q[12];
cx q[5], q[10];
cx q[12], q[11];
