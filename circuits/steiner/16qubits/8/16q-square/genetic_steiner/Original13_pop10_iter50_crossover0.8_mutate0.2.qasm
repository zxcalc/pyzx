// Initial wiring: [14, 15, 0, 2, 12, 9, 6, 5, 8, 11, 13, 7, 10, 4, 3, 1]
// Resulting wiring: [14, 15, 0, 2, 12, 9, 6, 5, 8, 11, 13, 7, 10, 4, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[13];
cx q[9], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[2], q[5];
cx q[5], q[4];
