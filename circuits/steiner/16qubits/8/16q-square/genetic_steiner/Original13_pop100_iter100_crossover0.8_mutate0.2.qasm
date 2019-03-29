// Initial wiring: [0, 12, 3, 14, 15, 7, 9, 8, 6, 13, 4, 2, 10, 5, 1, 11]
// Resulting wiring: [0, 12, 3, 14, 15, 7, 9, 8, 6, 13, 4, 2, 10, 5, 1, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[15], q[8];
cx q[8], q[7];
cx q[9], q[10];
cx q[7], q[8];
cx q[8], q[15];
cx q[8], q[9];
cx q[1], q[6];
cx q[0], q[1];
cx q[1], q[6];
