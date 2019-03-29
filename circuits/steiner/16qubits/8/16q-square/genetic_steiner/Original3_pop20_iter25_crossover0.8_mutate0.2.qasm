// Initial wiring: [7, 6, 8, 1, 11, 5, 12, 15, 13, 0, 2, 10, 14, 3, 4, 9]
// Resulting wiring: [7, 6, 8, 1, 11, 5, 12, 15, 13, 0, 2, 10, 14, 3, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[14], q[9];
cx q[9], q[8];
cx q[13], q[14];
cx q[6], q[7];
cx q[5], q[10];
cx q[4], q[5];
cx q[2], q[5];
cx q[5], q[10];
cx q[10], q[5];
