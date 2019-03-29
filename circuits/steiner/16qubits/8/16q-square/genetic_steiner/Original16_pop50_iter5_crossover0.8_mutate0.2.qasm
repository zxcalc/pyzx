// Initial wiring: [1, 9, 4, 8, 6, 11, 12, 5, 14, 0, 2, 7, 10, 13, 15, 3]
// Resulting wiring: [1, 9, 4, 8, 6, 11, 12, 5, 14, 0, 2, 7, 10, 13, 15, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[8], q[7];
cx q[5], q[2];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[4];
cx q[11], q[10];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[9];
