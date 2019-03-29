// Initial wiring: [5, 7, 4, 0, 10, 6, 3, 12, 14, 9, 15, 11, 8, 1, 13, 2]
// Resulting wiring: [5, 7, 4, 0, 10, 6, 3, 12, 14, 9, 15, 11, 8, 1, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[14], q[9];
cx q[14], q[15];
cx q[8], q[15];
cx q[5], q[10];
cx q[10], q[11];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[10];
cx q[0], q[7];
