// Initial wiring: [13, 7, 5, 0, 2, 6, 14, 10, 3, 15, 12, 8, 11, 4, 9, 1]
// Resulting wiring: [13, 7, 5, 0, 2, 6, 14, 10, 3, 15, 12, 8, 11, 4, 9, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[6];
cx q[9], q[10];
cx q[10], q[11];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[9];
cx q[5], q[6];
cx q[2], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[2], q[3];
cx q[1], q[6];
cx q[6], q[7];
cx q[7], q[6];
