// Initial wiring: [2, 8, 10, 3, 15, 7, 9, 12, 4, 11, 0, 5, 6, 13, 1, 14]
// Resulting wiring: [2, 8, 10, 3, 15, 7, 9, 12, 4, 11, 0, 5, 6, 13, 1, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[0];
cx q[9], q[8];
cx q[10], q[5];
cx q[5], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[15], q[8];
cx q[11], q[12];
cx q[12], q[11];
cx q[5], q[10];
cx q[10], q[11];
cx q[10], q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[5], q[4];
cx q[10], q[5];
cx q[12], q[11];
