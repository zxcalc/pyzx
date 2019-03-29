// Initial wiring: [2, 4, 10, 13, 1, 3, 0, 5, 14, 11, 12, 9, 8, 6, 7, 15]
// Resulting wiring: [2, 4, 10, 13, 1, 3, 0, 5, 14, 11, 12, 9, 8, 6, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[13];
cx q[8], q[7];
cx q[9], q[6];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[0], q[7];
cx q[7], q[8];
cx q[0], q[1];
