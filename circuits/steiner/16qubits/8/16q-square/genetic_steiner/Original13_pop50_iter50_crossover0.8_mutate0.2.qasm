// Initial wiring: [5, 10, 14, 12, 9, 0, 3, 7, 4, 13, 11, 8, 6, 2, 1, 15]
// Resulting wiring: [5, 10, 14, 12, 9, 0, 3, 7, 4, 13, 11, 8, 6, 2, 1, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[4], q[3];
cx q[9], q[8];
cx q[10], q[9];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[10], q[11];
