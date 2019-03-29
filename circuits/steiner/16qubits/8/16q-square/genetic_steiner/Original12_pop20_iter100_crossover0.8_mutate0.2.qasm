// Initial wiring: [10, 15, 7, 6, 0, 4, 1, 3, 5, 12, 14, 9, 13, 11, 2, 8]
// Resulting wiring: [10, 15, 7, 6, 0, 4, 1, 3, 5, 12, 14, 9, 13, 11, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[7];
cx q[12], q[11];
cx q[14], q[15];
cx q[8], q[9];
cx q[5], q[10];
cx q[0], q[7];
