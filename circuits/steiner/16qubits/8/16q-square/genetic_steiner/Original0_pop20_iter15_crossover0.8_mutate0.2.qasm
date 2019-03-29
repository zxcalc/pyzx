// Initial wiring: [8, 15, 10, 3, 12, 6, 7, 4, 9, 13, 5, 14, 11, 0, 2, 1]
// Resulting wiring: [8, 15, 10, 3, 12, 6, 7, 4, 9, 13, 5, 14, 11, 0, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[14], q[13];
cx q[10], q[13];
cx q[10], q[11];
cx q[3], q[4];
cx q[4], q[11];
