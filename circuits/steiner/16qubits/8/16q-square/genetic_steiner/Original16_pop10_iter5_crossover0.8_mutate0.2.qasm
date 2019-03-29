// Initial wiring: [9, 6, 13, 10, 3, 7, 4, 2, 14, 5, 11, 12, 1, 15, 0, 8]
// Resulting wiring: [9, 6, 13, 10, 3, 7, 4, 2, 14, 5, 11, 12, 1, 15, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[7], q[6];
cx q[9], q[8];
cx q[14], q[9];
cx q[9], q[8];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[10], q[9];
cx q[9], q[14];
cx q[10], q[11];
cx q[14], q[9];
