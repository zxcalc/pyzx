// Initial wiring: [15, 12, 5, 8, 2, 3, 10, 1, 6, 11, 4, 0, 13, 14, 9, 7]
// Resulting wiring: [15, 12, 5, 8, 2, 3, 10, 1, 6, 11, 4, 0, 13, 14, 9, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[4];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[11];
cx q[11], q[12];
cx q[6], q[9];
cx q[5], q[10];
cx q[3], q[4];
