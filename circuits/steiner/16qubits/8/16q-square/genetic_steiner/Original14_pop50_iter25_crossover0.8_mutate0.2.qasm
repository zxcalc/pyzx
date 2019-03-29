// Initial wiring: [1, 0, 13, 9, 15, 14, 12, 8, 6, 11, 7, 10, 2, 5, 4, 3]
// Resulting wiring: [1, 0, 13, 9, 15, 14, 12, 8, 6, 11, 7, 10, 2, 5, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[11];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[15], q[8];
cx q[9], q[10];
cx q[10], q[11];
cx q[8], q[9];
