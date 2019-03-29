// Initial wiring: [12, 14, 0, 9, 6, 7, 13, 5, 2, 4, 8, 11, 10, 3, 15, 1]
// Resulting wiring: [12, 14, 0, 9, 6, 7, 13, 5, 2, 4, 8, 11, 10, 3, 15, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[8], q[9];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[6], q[5];
cx q[7], q[6];
cx q[0], q[7];
cx q[7], q[8];
cx q[8], q[9];
cx q[8], q[7];
cx q[9], q[8];
