// Initial wiring: [12, 9, 0, 10, 2, 4, 13, 8, 6, 11, 5, 15, 14, 7, 3, 1]
// Resulting wiring: [12, 9, 0, 10, 2, 4, 13, 8, 6, 11, 5, 15, 14, 7, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[6], q[5];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[7], q[8];
cx q[8], q[9];
