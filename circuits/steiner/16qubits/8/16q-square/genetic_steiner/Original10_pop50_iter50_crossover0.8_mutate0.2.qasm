// Initial wiring: [2, 8, 14, 13, 10, 4, 7, 12, 3, 0, 11, 9, 1, 15, 6, 5]
// Resulting wiring: [2, 8, 14, 13, 10, 4, 7, 12, 3, 0, 11, 9, 1, 15, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[5];
cx q[15], q[14];
cx q[14], q[13];
cx q[8], q[9];
cx q[9], q[14];
cx q[6], q[9];
cx q[2], q[5];
