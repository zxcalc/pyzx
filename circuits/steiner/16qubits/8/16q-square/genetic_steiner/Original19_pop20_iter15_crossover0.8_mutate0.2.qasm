// Initial wiring: [3, 1, 8, 0, 5, 12, 4, 9, 6, 14, 11, 15, 13, 7, 2, 10]
// Resulting wiring: [3, 1, 8, 0, 5, 12, 4, 9, 6, 14, 11, 15, 13, 7, 2, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[9], q[10];
cx q[5], q[10];
cx q[10], q[13];
cx q[10], q[11];
cx q[1], q[2];
