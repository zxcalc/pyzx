// Initial wiring: [4, 5, 17, 1, 3, 7, 8, 2, 13, 16, 0, 18, 9, 12, 14, 19, 10, 11, 15, 6]
// Resulting wiring: [4, 5, 17, 1, 3, 7, 8, 2, 13, 16, 0, 18, 9, 12, 14, 19, 10, 11, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[10], q[19];
cx q[9], q[11];
cx q[11], q[9];
cx q[5], q[14];
cx q[3], q[4];
cx q[2], q[7];
cx q[2], q[3];
