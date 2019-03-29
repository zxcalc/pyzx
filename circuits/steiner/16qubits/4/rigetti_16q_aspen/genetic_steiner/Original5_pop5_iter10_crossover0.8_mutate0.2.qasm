// Initial wiring: [14, 6, 9, 3, 12, 5, 15, 8, 13, 10, 4, 11, 1, 0, 2, 7]
// Resulting wiring: [14, 6, 9, 3, 12, 5, 15, 8, 13, 10, 4, 11, 1, 0, 2, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[8], q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[7], q[6];
cx q[8], q[7];
cx q[3], q[4];
