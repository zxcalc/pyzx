// Initial wiring: [3, 10, 13, 14, 11, 4, 8, 5, 9, 2, 12, 15, 7, 0, 1, 6]
// Resulting wiring: [3, 10, 13, 14, 11, 4, 8, 5, 9, 2, 12, 15, 7, 0, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[10];
cx q[10], q[9];
cx q[14], q[1];
cx q[13], q[14];
cx q[8], q[9];
cx q[3], q[12];
cx q[0], q[15];
