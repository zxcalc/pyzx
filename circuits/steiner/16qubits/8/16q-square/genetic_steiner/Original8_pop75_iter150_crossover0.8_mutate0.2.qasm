// Initial wiring: [9, 11, 5, 4, 14, 1, 8, 2, 6, 3, 7, 12, 0, 15, 13, 10]
// Resulting wiring: [9, 11, 5, 4, 14, 1, 8, 2, 6, 3, 7, 12, 0, 15, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[15], q[14];
cx q[15], q[8];
cx q[10], q[13];
cx q[9], q[14];
cx q[8], q[9];
cx q[9], q[14];
cx q[7], q[8];
cx q[5], q[10];
cx q[10], q[11];
