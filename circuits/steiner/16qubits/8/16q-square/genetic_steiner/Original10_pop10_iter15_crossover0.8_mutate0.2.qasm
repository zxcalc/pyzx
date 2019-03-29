// Initial wiring: [8, 5, 13, 14, 4, 11, 6, 9, 12, 15, 0, 7, 3, 10, 1, 2]
// Resulting wiring: [8, 5, 13, 14, 4, 11, 6, 9, 12, 15, 0, 7, 3, 10, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[9], q[6];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[12], q[11];
cx q[8], q[15];
cx q[3], q[4];
cx q[1], q[6];
cx q[6], q[9];
