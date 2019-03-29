// Initial wiring: [1, 4, 15, 8, 2, 0, 11, 9, 6, 14, 5, 10, 7, 13, 12, 3]
// Resulting wiring: [1, 4, 15, 8, 2, 0, 11, 9, 6, 14, 5, 10, 7, 13, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[5];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[9];
cx q[4], q[5];
cx q[2], q[3];
