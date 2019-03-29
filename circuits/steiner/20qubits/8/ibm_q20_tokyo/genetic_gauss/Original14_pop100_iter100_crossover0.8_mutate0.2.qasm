// Initial wiring: [3, 9, 19, 1, 17, 4, 11, 2, 7, 18, 14, 6, 0, 15, 13, 12, 16, 5, 8, 10]
// Resulting wiring: [3, 9, 19, 1, 17, 4, 11, 2, 7, 18, 14, 6, 0, 15, 13, 12, 16, 5, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[1];
cx q[10], q[3];
cx q[13], q[11];
cx q[5], q[14];
cx q[2], q[14];
cx q[1], q[14];
cx q[0], q[1];
cx q[2], q[8];
