// Initial wiring: [12, 2, 14, 7, 15, 0, 11, 9, 5, 4, 13, 10, 8, 3, 1, 6]
// Resulting wiring: [12, 2, 14, 7, 15, 0, 11, 9, 5, 4, 13, 10, 8, 3, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[12], q[11];
cx q[14], q[9];
cx q[10], q[13];
cx q[5], q[6];
cx q[4], q[5];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
