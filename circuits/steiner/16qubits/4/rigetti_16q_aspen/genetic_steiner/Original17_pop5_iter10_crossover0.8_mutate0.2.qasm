// Initial wiring: [15, 11, 9, 4, 7, 14, 1, 12, 3, 13, 0, 5, 2, 10, 6, 8]
// Resulting wiring: [15, 11, 9, 4, 7, 14, 1, 12, 3, 13, 0, 5, 2, 10, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[7], q[8];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[7];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[5], q[4];
cx q[6], q[5];
cx q[1], q[2];
