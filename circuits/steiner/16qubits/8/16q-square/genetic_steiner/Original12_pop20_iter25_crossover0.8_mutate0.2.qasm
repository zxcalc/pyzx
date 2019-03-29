// Initial wiring: [2, 0, 14, 4, 1, 10, 12, 8, 6, 5, 3, 11, 15, 7, 13, 9]
// Resulting wiring: [2, 0, 14, 4, 1, 10, 12, 8, 6, 5, 3, 11, 15, 7, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[1];
cx q[9], q[6];
cx q[13], q[12];
cx q[14], q[15];
cx q[9], q[10];
cx q[5], q[10];
cx q[0], q[7];
