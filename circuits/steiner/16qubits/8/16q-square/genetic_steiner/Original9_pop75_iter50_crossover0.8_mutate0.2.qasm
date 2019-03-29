// Initial wiring: [11, 7, 1, 15, 5, 3, 4, 14, 6, 10, 13, 9, 0, 2, 8, 12]
// Resulting wiring: [11, 7, 1, 15, 5, 3, 4, 14, 6, 10, 13, 9, 0, 2, 8, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[9], q[8];
cx q[14], q[13];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[2], q[5];
